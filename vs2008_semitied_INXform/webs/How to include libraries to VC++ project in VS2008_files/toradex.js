
var counter = 3;
var $modal = null;

$(document).ready(function(e) {

    $(".youtube-link").grtyoutube({
        autoPlay:true
    });

    if($("#scroll-width-item") && $("#scroll-width-item").val() != "" && $("#scroll-width-item").val() != undefined) {
        counter = 5;
    }

    $modal = $('#main-modal');

    // fix css for IE
    function isIE() {
        var rv = -1;
        if (navigator.appName == 'Microsoft Internet Explorer') {
            var ua = navigator.userAgent;
            var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null)
                rv = parseFloat(RegExp.$1);
        }
        else if (navigator.appName == 'Netscape') {
            var ua = navigator.userAgent;
            var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null)
                rv = parseFloat(RegExp.$1);
        }
        return rv;
    }

    if (isIE() > -1) {
        $('.feedback-widget').css('right', '16px');
    }

    // overlay dialog
    $(".overlay_dlg").click(function () {
        target = $(this).attr("target");
        if (target !== "undefined") {
            showModel(target);
        }
        return false;
    });

    // language & location selector
    $(".list_lang ul li a").click(function () {
        $(".list_lang ul li a.active").removeClass("active");
        $("#UserPref_lang").val($(this).attr("rel"));
        $(this).addClass("active");
    });

    /*if (!($.browser && $.browser.msie && parseInt($.browser.version, 10) <= 8)) {
        var locationImage = $('#my_location');

        // do not use image mapster for IE8 and under
        $(".map_location ul li a").hover(function () {
            if (!$(this).hasClass("active")) {
                locationImage.mapster("set", "select", $(this).attr("title"));
            }

        }, function () {
            if (!$(this).hasClass("active")) {
                locationImage.mapster("set", "deselect", $(this).attr("title"));
                locationImage.mapster("set", "select", $(".map_location ul li a.active").attr("title"));
            }
        });

        $(".map_location ul li a").click(function () {
            $(".map_location ul li a.active").animate({paddingTop: "6px", paddingBottom: "6px"}, 300);
            locationImage.mapster("set", "deselect", $(".map_location ul li a.active").attr("title"));
            $(".map_location ul li a.active").removeClass("active");

            $(this).addClass("active");
            $("#UserPref_shop").val($(this).attr("title"));
            locationImage.mapster("set", "select", $(this).attr("title"));
            $(this).animate({paddingTop: "3px", paddingBottom: "9px"}, 300);
        });

        if(locationImage.length > 0) {
            var xref = {
                us: "North/South America",
                eu: "EU/Other Countries",
                ch: "Switzerland",
                cn: "China"
            };
            locationImage.mapster({
                altImage: "/images/map_location_full_test_green.png",
                fillOpacity: 1,
                isSelectable: true,
                singleSelect: true,
                mapKey: 'alt',
                listKey: 'alt',
                onClick: function (e) {
                    $(".map_location ul li a.active").animate({paddingTop: "6px", paddingBottom: "6px"}, 300);
                    locationImage.mapster("set", "deselect", $(".map_location ul li a.active").attr("title"));
                    $(".map_location ul li a.active").removeClass("active");

                    locationImage.mapster("set", "select");
                    $(".map_location ul li a[title=" + $(this).attr("alt") + "]").addClass("active");
                    $("#UserPref_shop").val($(".map_location ul li a[title=" + $(this).attr("alt") + "]").attr("title"));
                    $(".map_location ul li a[title=" + $(this).attr("alt") + "]").animate({
                        paddingTop: "3px",
                        paddingBottom: "9px"
                    }, 300);
                },
                onMouseover: function (e) {
                },
                onMouseout: function (e) {
                },
                areas: [
                    {
                        key: "ch",
                        strokeColor: "ffffff",
                        strokeWidth: 2,
                        stroke: true
                    },
                    {
                        key: $(".map_location ul li a.active").attr("title"),
                        selected: true,
                        altImageOpacity: 1,
                        fillOpacity: 1
                    }
                ]
            });
        }
    } else {
        $(".map_location ul li a").click(function () {
            $(".map_location ul li a.active").animate({paddingTop: "6px", paddingBottom: "6px"}, 300);
            $(".map_location ul li a.active").removeClass("active");

            $(this).addClass("active");
            $("#UserPref_shop").val($(this).attr("title"));
            $(this).animate({paddingTop: "3px", paddingBottom: "9px"}, 300);
        });

        $("map area").click(function () {
            $(".map_location ul li a.active").animate({paddingTop: "6px", paddingBottom: "6px"}, 300);
            $(".map_location ul li a.active").removeClass("active");

            $(".map_location ul li a[title=" + $(this).attr("title") + "]").addClass("active");
            $("#UserPref_shop").val($(".map_location ul li a[title=" + $(this).attr("title") + "]").attr("title"));
            $(".map_location ul li a[title=" + $(this).attr("alt") + "]").animate({
                paddingTop: "3px",
                paddingBottom: "9px"
            }, 300);
        });
    }*/

    // cart/add to cart form
    $("#add-to-cart-form input").keydown(function (event) {
        // Allow: backspace, delete, tab, escape, and enter
        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        } else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }
    });

    // $("a[rel=lightbox], a[rel='lightbox nofollow']").lightBox();

    function checkScrollable(itemOnPage) {
        var listScrollable = $("body").find(".block-scrollable");
        for (var i = 0; i < listScrollable.length; i++) {
            if ($(listScrollable[i]).find(".item").length <= itemOnPage) {
                $(listScrollable[i]).find(".scrollable-nav").addClass("invisible");
            }
            else {
                $(listScrollable[i]).find(".scrollable-nav").removeClass("invisible");
            }
        }
    }

    if(jQuery().scrollable) {
        checkScrollable(counter);

        $(".scrollable").scrollable({
            vertical: false,
            onSeek: function (element) {
                if (this.getSize() - this.getIndex() <= counter) {
                    this.getNaviButtons().last().addClass("disabled");
                }
                else {
                    this.getNaviButtons().last().removeClass("disabled");
                }
            }

        });//.autoscroll({ autoplay: true });
    }

    /* responsive layout for scrollable */
    function resizeScrollable() {
        var maxWindow = 1010;
        var maxScroll = 900;
        var maxHeightScroll = 275;
        var maxWidthItem = 260;
        var counter = 3;
        if($("#scroll-width-item") && $("#scroll-width-item").val() != "" && $("#scroll-width-item").val() != undefined) {
            maxWidthItem = $("#scroll-width-item").val();
            maxHeightScroll = 160;
            counter = 5;
        }
        if($("#scroll-height-item") && $("#scroll-height-item").val() != "" && $("#scroll-height-item").val() != undefined) {
            maxHeightScroll = $("#scroll-height-item").val();
        }

        if ($(window).width() < 1010) {
            if ($(window).width() < 767)
                counter = 2;
            if ($(window).width() < 480)
                counter = 1;
            $(".scrollable").each(function (i) {
                var maxHeightItem = $(this).find(".items").first().height() + 30;
                $(this).css({
                    width: (maxScroll - Math.abs($(window).width() - maxWindow)) + "px",
                    height: maxHeightItem + "px"
                });
                var wItem = $(this).width() / counter - ($(this).find(".item").first().outerWidth(true) - $(this).find(".item").first().width());
                $(this).find(".item").css({width: wItem + "px"});
                checkScrollable(counter);
            });
        }
        else if ($(window).width() >= 1010) {
            $(".scrollable").each(function (i) {
                var maxHeightItem = $(this).find(".items").first().height() + 30;
                $(this).css({width: maxScroll + "px", height: maxHeightScroll + "px"});
                $(this).find(".item").css({width: maxWidthItem + "px"});
                checkScrollable(counter);
            });
        }
    }

    resizeScrollable();


    $(window).resize(function () {
        setTimeout(resizeScrollable, 300);
        if (typeof(autoResizeIframe) != 'undefined') {
            autoResizeIframe('overlay_ifrm');
        }
    });

    $(".navbar-nav .dropdown").hover(function () {
        if ($(window).width() >= 768) {
            $(this).children(".dropdown-menu").show();
            $(this).addClass("open");
        }
    }, function () {
        if ($(window).width() >= 768) {
            $(this).children(".dropdown-menu").hide();
            $(this).removeClass("open");
        }
    });

    $(".navbar-nav .dropdown").on("click", function () {
        if ($(window).width() < 768) {
            $(this).children(".dropdown-menu").toggle(0, function () {
                $(this).show();
            });
            $(this).toggleClass("open");
        }
    });

    $('a[data-toggle="tooltip"]').tooltip();

    /* action for compare widget */
    function moveCompareWidget() {
        var documentHeight = $(document).height();
        var windowHeight = $(window).height();
        var footerHeight = $(".bg-footer-1").height() + $(".bg-footer-2").height();
        var windowScrollTop = $(window).scrollTop();
        //console.log("doc height: " + documentHeight + ", window height: " + windowHeight + ", footer height: " + footerHeight + ", scroll top: " + windowScrollTop);
        if (documentHeight - windowScrollTop - footerHeight <= windowHeight) {
            $(".compare-widget").css({bottom: windowHeight - (documentHeight - windowScrollTop - footerHeight)});
        }
        else {
            $(".compare-widget").css({bottom: 0});
        }
    }

    $(window).scroll(moveCompareWidget);
    $(window).resize(moveCompareWidget);

    $(".remove-compare-product").on("click", function () {
        if ($(".compare-widget .row").find(".product").length == 1) {
            $(".compare-widget").slideUp(300, function () {
                $(this).removeClass("open");
            });
        }
        var checkBoxItem = $(this).parent().get(0).classList[$(this).parent().get(0).classList.length - 1];
        $("." + checkBoxItem).attr("checked", false);
        $(this).parent().remove();
    });

    var countCompareItems = 0;
    var totalCompareItems = 5;
    $("input.add-to-compare").on("click", function () {
        moveCompareWidget();
        var compareItem = $.find("input.add-to-compare:checked").length;
        /*
         if($(".compare-widget").hasClass("minimize")) {
         $(".compare-widget .row").slideToggle(300, function() {
         $(this).css({overflow: "visible"});
         $(".compare-widget").toggleClass("minimize");
         });
         }
         */
        if ($(this).is(":checked")) {
            countCompareItems++;
            $(this).addClass("compare-product-" + countCompareItems);
            var productImg = $(this).parents(".product").find(".img").html();
            var productName = $(this).parents(".product").find(".name").html();
            var product = "<div class='col-xs-2 product compare-product-" + countCompareItems + "'><a class='remove-compare-product'><i class='fa fa-times'></i></a><p>" + productImg + "</p><p>" + productName + "</p></div>"

            if (compareItem <= totalCompareItems) {
                $(".compare-widget .row .col-btn").before(product);
                if (!$(".compare-widget").hasClass("open")) {
                    $(".compare-widget").slideDown(300, function () {
                        $(this).addClass("open");
                    });
                }
            }
        }
        else {
            $(".compare-widget .row").find("." + this.classList[this.classList.length - 1]).remove();
            $(this).removeClass(this.classList[this.classList.length - 1]);
            if ($(".compare-widget .row").find(".product").length < 1) {
                $(".compare-widget").slideUp(300, function () {
                    $(this).removeClass("open");
                });
            }
        }
    });

    $(".clear-compare-widget").on("click", function () {
        $("input.add-to-compare:checked").attr("checked", false);
        $(".compare-widget").slideUp(300, function () {
            $(".compare-widget .row").find(".product").remove();
            $(this).removeClass("open");
        });
    });

    $(".minimize-compare-widget").on("click", function () {
        $(".compare-widget .row").slideToggle(300, function () {
            $(this).css({overflow: "visible"});
            $(".compare-widget").toggleClass("minimize");
        });
    });

    // init popover
    $("[data-toggle='popover']").popover({
        html: true,
        container: 'body',
        trigger: 'click'
    });

    // init social sharing 
    $(".show-share-icon").each(function () {
        var $link = $(this);

        var html = [];
        html.push("<div class='social-sharing-inline'>");
        html.push("<div class='list-unstyled'>");
        html.push('<a href="https://www.facebook.com/sharer/sharer.php?u={{url}}" target="_blank" class="icon-mini icon-mini-facebook"></a>');
        html.push('<a href="https://plus.google.com/share?url={{url}}" target="_blank" class="icon-mini icon-mini-google"></a>');
        html.push('<a href="https://twitter.com/intent/tweet?url={{url}}" target="_blank" class="icon-mini icon-mini-twitter"></a>');
        html.push('<a href="https://www.linkedin.com/shareArticle?mini=true&url={{url}}" target="_blank" class="icon-mini icon-mini-linkedin"></a>');
        html.push("</div>");
//        html.push('<a href="#" class="close cancel">&times;</a>');        
        html.push("</div>");

        var url = $link.attr('href');
        if (!url) {
            url = $link.attr('src');
        }

        if (url.substring(0, 4) != 'http') {
            url = window.location.protocol + "//" + window.location.host + '/' + url;
        }

        html = html.join('').replace(/{{url}}/gi, url);
        var $html = $(html);
        $html.css('top', ($link.position().top + 5) + 'px').css('left', ($link.position().left + 5) + 'px');

        var timer = {};

        // bind events for $links
        $link.before($html)
        .mouseenter(function () {
            $html.fadeIn('fast');
            $html.$target = $link;
            clearTimeout(timer[$link.index()]);
        })
        .mouseleave(function () {
            timer[$link.index()] = setTimeout(function () {
                $html.fadeOut('fast');
            }, 500);
        });

        // bind events for $html
        $html.mouseenter(function () {
            clearTimeout(timer[$html.$target.index()]);
        }).mouseleave(function () {
            timer[$html.$target.index()] = setTimeout(function () {
                $html.fadeOut('fast');
            }, 500);
        });

        $html.find('a').click(function (event) {
            event.stopPropagation();
            if ($(this).hasClass('cancel')) {
                $html.hide();
                event.preventDefault();
            }

            return true;
        });
    });

    // init TOP Menu 
    var $old = null;
    $('#navbar-main-menu a[data-url]').click(function () {
        if (mobilecheck()) {
            if ($(this).attr('data-click') == 1) {
                window.location.href = $(this).data('url');
            } else {
                if ($old) {
                    $old.attr('data-click', 0);
                }

                $old = $(this);

                $('#navbar-main-menu .open').removeClass('open');
                $('#navbar-main-menu ul.dropdown-menu').attr('style', '');
                $old.attr('data-click', 1);
            }
            return true;
        } else {
            window.location.href = $(this).data('url');
        }
    });

    $(".expandable").click(function () {
        $(this).next().slideToggle(300).toggleClass("expanded");
        $(this).toggleClass("expanded");
    });

    // hide redundance filter menu on mobile
    $(".filter-block").click(function (e) {
        $(".main-content").addClass("filter-hide");
    });

    _playerObj = $('#myytplayer');

    if (_playerObj.size() > 0) {
        // 2. This code loads the IFrame Player API code asynchronously.
        var tag = document.createElement('script');

        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    }
});

window.mobilecheck = function () {
    if ($(window).width() < 768) {
        return true;
    }
    var check = false;
    (function (a, b) {
        if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true
    })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
};


function closeModal(target) {
    if ($modal) {
        $modal.modal('hide');
    }
    if(target !== undefined) {
        if(target == '') {
            window.location.reload();
        } else {
            window.location = target;
        }
    }
}

/** products filter **/
var filterParams = {
    url: '/products',
    ids: [],
    values: [],
    order: null,
    update: null,
    loading: null,
};

function createQueryString() {
    var url = filterParams.url;
    var str = "";

    // add ids to params 
    if (filterParams.ids && filterParams.ids.length > 0) {
        str = "id=" + filterParams.ids.join(',');
    }

    // add values to params 
    if (filterParams.values && filterParams.values.length > 0) {
        var split = "";
        if (str.length > 0) {
            split = "&"
        }
        str += split + "value=" + filterParams.values.join('::');
    }

    // add order to params 
    if (filterParams.order) {
        var split = "";
        if (str.length > 0) {
            split = "&"
        }

        str += split + "order=" + filterParams.order;
    }

    var urlLink = filterParams.url + "?" + str;
    var ajaxLink = urlLink + "&ajax=1";

    // update browser url 
    window.history.pushState("product-filter", "filter", urlLink);

    // do request 
    $.ajax({
        url: ajaxLink,
        type: 'get',
        beforeSend: function () {
            // show loading   
            filterParams.update.append(filterParams.loading);
        },
        success: function (html) {
            filterParams.update.html(html);
        },
        error: function () {
            alert('error');
        },
        complete: function () {
            //  hide loading 
            filterParams.loading.remove();
        }
    });
}

function buildQuery(_cur) {

    // add more filter 
    if (_cur.is(':checked')) {
        // find by key
        if (_cur.data('find') == 'key') {
            filterParams.ids.push(_cur.val());
        } else {
            filterParams.values.push(_cur.val());
        }
    } else {
        // remove filter         
        var v = _cur.val();

        // remove key 
        if (_cur.data('find') == 'key') {
            for (var i = 0; i < filterParams.ids.length; i++) {
                if (filterParams.ids[i] == v) {
                    filterParams.ids.splice(i, 1);
                    break;
                }
            }
        } else {
            // remove value 
            for (var i = 0; i < filterParams.values.length; i++) {
                if (filterParams.values[i] == v) {
                    filterParams.values.splice(i, 1);
                    break;
                }
            }
        }
    }

    createQueryString();
}

function initFilter() {
    filterParams.update = $('.products-list');
    filterParams.loading = $('<div class="loading"><div class="box"><img src="/images/loading.gif" /></div></div>');

    // init params
    $('.filter-section input[type=checkbox]').each(function () {
        var _cur = $(this);
        if (_cur.is(':checked')) {
            if (_cur.data('find') == 'key') {
                filterParams.ids.push(_cur.val());
            } else {
                filterParams.values.push(_cur.val());
            }
        }
    });

    // init sort action 
    $('#update-results [data-sort]').click(function (event) {
        event.preventDefault();
        var _cur = $(this);
        _cur.siblings().css('font-weight', '');
        _cur.css('font-weight', 'bold');
        filterParams.order = _cur.data('sort');
        createQueryString();

    });

    // init section collapse or expand
    $('.product_filter_title').click(function () {
        $(this).toggleClass('up').next().slideToggle('fast');
    });

    // init ajax load
    $(".filter-section input[type=checkbox]").change(function () {
        var _cur = $(this);
        buildQuery(_cur);
    });
}

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
var _playerObj = null;

function onYouTubeIframeAPIReady() {
    if(_playerObj) {
        player = new YT.Player('myytplayer', {
            height: _playerObj.data('min-h'),
            width: _playerObj.data('min-w'),
            videoId: _playerObj.data('youtube-id'),
            suggestedQuality: 'large',
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
        
    }
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
    // event.target.playVideo();
    player.cueVideoById({'videoId': _playerObj.data('youtube-id'), 'startSeconds': 0, 'suggestedQuality': 'large'});
    // player.playVideo();
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
function onPlayerStateChange(event) {
    _playerObj = $('#myytplayer');
    if (event.data == YT.PlayerState.PLAYING) {
        // start
        _playerObj.animate({width: _playerObj.data('max-w'), height: _playerObj.data('max-h')});
    } else if (event.data == YT.PlayerState.PAUSED) {
        _playerObj.animate({width: _playerObj.data('min-w'), height: _playerObj.data('min-h')});
    }
}

function number_format(number, decimals, decPoint, thousandsSep) {
    //   example 1: number_format(1234.56)
    //   returns 1: '1,235'
    //   example 2: number_format(1234.56, 2, ',', ' ')
    //   returns 2: '1 234,56'
    //   example 3: number_format(1234.5678, 2, '.', '')
    //   returns 3: '1234.57'
    //   example 4: number_format(67, 2, ',', '.')
    //   returns 4: '67,00'
    //   example 5: number_format(1000)
    //   returns 5: '1,000'
    //   example 6: number_format(67.311, 2)
    //   returns 6: '67.31'
    //   example 7: number_format(1000.55, 1)
    //   returns 7: '1,000.6'
    //   example 8: number_format(67000, 5, ',', '.')
    //   returns 8: '67.000,00000'
    //   example 9: number_format(0.9, 0)
    //   returns 9: '1'
    //  example 10: number_format('1.20', 2)
    //  returns 10: '1.20'
    //  example 11: number_format('1.20', 4)
    //  returns 11: '1.2000'
    //  example 12: number_format('1.2000', 3)
    //  returns 12: '1.200'
    //  example 13: number_format('1 000,50', 2, '.', ' ')
    //  returns 13: '100 050.00'
    //  example 14: number_format(1e-8, 8, '.', '')
    //  returns 14: '0.00000001'

    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number;
    var prec = !isFinite(+decimals) ? 0 : Math.abs(decimals);
    var sep = (typeof thousandsSep === 'undefined') ? ',' : thousandsSep;
    var dec = (typeof decPoint === 'undefined') ? '.' : decPoint;
    var s = '';

    var toFixedFix = function (n, prec) {
        var k = Math.pow(10, prec);
        return '' + (Math.round(n * k) / k)
            .toFixed(prec);
    };

    // @todo: for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }

    return s.join(dec);
}

function showModel(url) {
    document.getElementById('overlay_ifrm').contentWindow.document.body.innerHTML =
        '<p style="text-align: center"><img style="margin-top:23px;" src="/images/loading.gif"></p>';
    $modal.modal({backdrop: 'static'});
    $modal.find('iframe').height(56).attr('src', url).unbind().load(function () {
        autoResizeIframe('overlay_ifrm');
    });
}

function autoResizeIframe(id) {
    if (id == "mailchim") {
        $(obj.get(0).contentWindow.document.body).css("margin-top", "10px");
    }

    var obj = $('#' + id);
    if (obj.size() == 0) {
        return;
    }

    obj.height(obj.get(0).contentWindow.document.body.scrollHeight + 20);
}
