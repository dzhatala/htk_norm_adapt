$(document).ready(function(e) {
    //docs info
    var docs_info = [];
    $(".docs-info").each(function() {
        var href = $(this).attr('href');
        var expl = href.split('/');
        var expl1 = expl[3].split('-');
        docs_info.push({'attr-info':$(this).attr('attr-info'), 'docs-id':expl1[0]});
    });
    if(docs_info) {
        $.ajax({
            url:'/service/get-doc-info',
            type:'post',
            data:{'docs_info':docs_info},
            success:function(html){
                if(html) {
                    var parse = jQuery.parseJSON(html);
                    $(".docs-info").each(function(i) {
                        $(this).after(parse[i]);
                    });
                }
            }
        });
    }

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $(".wrapper").toggleClass("toggled");
    });

    //toggle click
    $(".toggle-click").toggle(
        function() {
            var data_target = $(this).attr('data-target');
            $('#' + data_target).show();
            $(this).find(".fa-caret-down").show();
            $(this).find(".fa-caret-right").hide();
        }, function() {
            var data_target = $(this).attr('data-target');
            $('#' + data_target).hide();
            $(this).find(".fa-caret-down").hide();
            $(this).find(".fa-caret-right").show();
        }
    );

    $modal = $('#main-modal');

    // overlay dialog
    $(".overlay_dlg").click(function() {
        $("#build-iframe").html('<iframe id="overlay_ifrm" src="about:blank" style="width:100%; overflow: hidden; border:0; background-color: #fff;"></iframe>');

        $("#overlay_ifrm").html('');
        $("#overlay_ifrm").attr({'src':''});
        $("#overlay_ifrm").css({'height':'1px'});

        $("#overlay_ifrm_tag").html('');
        $("#overlay_ifrm_tag").attr({'src':''});
        $("#overlay_ifrm_tag").css({'height':'1px'});

        target = $(this).attr("target");
        if (target !== "undefined") {
            _ourl = target;
            $modal.modal({backdrop: 'static'});
            document.getElementById('overlay_ifrm').contentWindow.document.body.innerHTML = '<center><img style="margin-top:23px;" src="/images/loading.gif"></center>';
            $("#overlay_ifrm").height(56).attr('src', target).unbind().load(function() {
                autoResizeIframe('overlay_ifrm');
            });
        }
        return false;
    });

    $(".overlay_dlg_tag").click(function() {
        $("#build-iframe").html('<iframe id="overlay_ifrm_tag" src="about:blank" style="width:100%; overflow: hidden; border:0; background-color: #fff;"></iframe>');
        
        $("#overlay_ifrm_tag").html('');
        $("#overlay_ifrm_tag").attr({'src':''});
        $("#overlay_ifrm_tag").css({'height':'1px'});

        $("#overlay_ifrm").html('');
        $("#overlay_ifrm").attr({'src':''});
        $("#overlay_ifrm").css({'height':'1px'});
        target = $(this).attr("target");
        if (target !== "undefined") {
            _ourl = target;
            $modal.modal({backdrop: 'static'});
            document.getElementById('overlay_ifrm_tag').contentWindow.document.body.innerHTML = '<center><img style="margin-top:23px;" src="/themes/toradex-v3/images/loading.gif"></center>';
            $("#overlay_ifrm_tag").height(500).attr('src', target);
        }
        return false;
    });
    
    $("#update-subscription-form").submit(function() {
        email = $(this).find("#ContentSubscription_email").val();
        if (email === "" || email === 'email@address.com') {
            alert("Please enter your email to subscribe");
            return false;
        }
        if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,4})+$/.test(email)) {
            alert("Your email is invalid! Please correct it and try again.");
            return false;
        }
    });

    $("#content_table_toggle").click(function() {
        if ($(this).html() == "hide") {
            $(this).html("show");
            $('.overflow').slideUp();
        } else {
            $(this).html("hide");
            $('.overflow').slideDown();
        }
        return false;
    });

    // active tab
    var url = document.location.toString();
    if (url.match(/#/)) {
        var urlId = url.split('#')[1];
        var tab = $('.tab-content').find('#' + urlId);
        var tabId = '';
        if(tab.parent().hasClass('tab-pane') == true) {
            tabId = tab.parent().attr('id');
        }else if(tab.parent().parent().hasClass('tab-pane') == true) {
            tabId = tab.parent().parent().attr('id');
        }else if(tab.parent().parent().parent().hasClass('tab-pane') == true) {
            tabId = tab.parent().parent().parent().attr('id');
        }else if(tab.parent().parent().parent().parent().hasClass('tab-pane') == true) {
            tabId = tab.parent().parent().parent().parent().attr('id');
        }
        if(tabId) {
            $('.tabs a[href="#' + tabId + '"]').tab('show');
        }
        $('html, body').animate({
            scrollTop: $('#' + urlId + '').offset().top
        }, 1000);
    }

    //click on # link
    $('.right-wrapper a').click(function(){
        var url = $(this).attr('href');
        if (url.match(/#/)) {
            var urlId = url.split('#')[1];
            var tab = $('.tab-content').find('#' + urlId);
            var tabId = '';
            if(tab.hasClass('tab-pane') == true) {
                tabId = tab.attr('id');
            }else if(tab.parent().hasClass('tab-pane') == true) {
                tabId = tab.parent().attr('id');
            }else if(tab.parent().parent().hasClass('tab-pane') == true) {
                tabId = tab.parent().parent().attr('id');
            }else if(tab.parent().parent().parent().hasClass('tab-pane') == true) {
                tabId = tab.parent().parent().parent().attr('id');
            }else if(tab.parent().parent().parent().parent().hasClass('tab-pane') == true) {
                tabId = tab.parent().parent().parent().parent().attr('id');
            }
            if(tabId) {
                $('.tabs a[href="#' + tabId + '"]').tab('show');
                // $('html, body').animate({
                //     scrollTop: $('#' + urlId + '').offset().top
                // }, 1000);
            }
        }
    });

    
});

function setCookie(cname, cvalue, expireTime) {
    var d = new Date();
    d.setTime(d.getTime() + (expireTime*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function deleteCookie( name ) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}