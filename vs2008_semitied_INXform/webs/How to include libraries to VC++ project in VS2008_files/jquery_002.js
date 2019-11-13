/**
 * jQuery Toradex plugin file.
 *
 * @author Tuan Phan <tuan.phan@toradex.com>
 */

(function($) {

    $.trdx = {
        version : '2.0',

        submitForm : function (element, url, params) {
            var f = $(element).parents('form')[0];
            if (!f) {
                f = document.createElement('form');
                f.style.display = 'none';
                f.method = 'POST';
                document.body.appendChild(f);
            }
            if (typeof url == 'string' && url != '') {
                f.action = url;
            }
            if (element.target != null) {
                f.target = element.target;
            }

            var inputs = [];
            $.each(params, function(name, value) {
                var input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("name", name);
                input.setAttribute("value", value);
                f.appendChild(input);
                inputs.push(input);
            });
            
            // remember who triggers the form submission
            // this is used by jquery.yiiactiveform.js
            $(f).data('submitObject', $(element));
            
            $(f).trigger('submit');

            $.each(inputs, function() {
                f.removeChild(this);
            });
        },

        isChinaSite: function() {
            return window.location.href.match(/:\/\/([-a-z0-9]+\.)?(toradex\.cn)/);
        }
    };

    $.fn.charCount = function (params) {
        
        var oldVal = "";
        var p =  {
            limitLength: false,
            maxLength: 500,
            counterMessage: "%d characters",
            counterElement: "display_count"
        };

        if(params) {
            jQuery.extend(p, params);
        }

        //for each keyup function on text areas
        $(this).keyup(function() {
            var val = $(this).val();
            if(p.limitLength) {
                if(val.length > p.maxLength) {
                    this.val = oldVal;
                } else {
                    oldVal = val;
                }
            }
            jQuery("#"+p.counterElement).html(p.counterMessage.sprintf(val.length));
        });
        // update current counter
        if($(this).val()) {
            $("#"+p.counterElement).html(p.counterMessage.sprintf($(this).val().length));
        }
    };
    
    $.fn.wordCount = function (params) {
        var total_words;
        var p =  {
            counterElement: "display_count"
        };

        if(params) {
            jQuery.extend(p, params);
        }

        //for each keypress function on text areas
        this.keypress(function()
        {
            total_words = this.value.split(/[\s\.\?]+/).length;
            jQuery('#'+p.counterElement).html(total_words);
        });
    };
    
})(jQuery);

$(document).ready(function(e) {
    // register google tracking events
    if(typeof(gaTrackEvent) !== undefined) {
        $("a.ga-track-event").on('click', linkTrackGaEvent);
        $("a[href*='docs.toradex.com']").on('click', linkTrackGaEvent);
    }

    function linkTrackGaEvent(e) {
        var c = $(this).data('category') || 'Undefined';
        var a = $(this).data('action') || 'Download';
        var l = $(this).data('label') || $(this).text();
        var v = $(this).data('value') || '';

        if((c === 'Undefined') && (url = $(this).attr('href'))) {
            parts = url.split('/');
            parts = (parts[parts.length - 1]).split('?');
            parts = (parts[parts.length - 1]).split('.');
            c = parts[parts.length - 1];
            l += ' - ' + parts[0];
        }

        gaTrackEvent(c, a, l, v);
    }
    
    function doTrackGaEvent(c, a, l, v) {
        gaTrackEvent(c, a, l, v);
    }
    
    // register search pagination
    $('a.gsc-cursor-page').on('click', function() {
        if($(this).attr('href') !== '#') {
            doSearch($(this).attr('href'));
            return false;
        }
    });
    
    // load search result
    var url = $('#search-result-container .lazy-search').first().data('url');
    if(url !== undefined) {
        doSearch(url);
    }
    
    function doSearch(url) {
        $('#search-result-container').html('<p>Searching results for you ...</p>');
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'html',
            success: function (res) {
                $('#search-result-container').html(res).fadeIn('slow');
            }
        });
    }

});
