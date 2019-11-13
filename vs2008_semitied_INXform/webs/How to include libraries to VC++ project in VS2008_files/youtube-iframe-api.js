// Define YT_ready function.
var YT_ready = (function () {
    var onReady_funcs = [], api_isReady = false;
    /* @param func function     Function to execute on ready
     * @param func Boolean      If true, all qeued functions are executed
     * @param b_before Boolean  If true, the func will added to the first
     position in the queue */
    return function (func, b_before) {
        if (func === true) {
            api_isReady = true;
            while (onReady_funcs.length) {
                // Removes the first func from the array, and execute func
                onReady_funcs.shift()();
            }
        } else if (typeof func == "function") {
            if (api_isReady) {
                func();
            } else {
                onReady_funcs[b_before ? "unshift" : "push"](func);
            }
        }
    };
})();

// This function will be called when the API is fully loaded
function onYouTubePlayerAPIReady() {
    YT_ready(true);
}

// Load YouTube Frame API
// and register the frames
// (function () {
//     // Closure, to not leak to the scope
//     var s = document.createElement("script");
//     s.src = (location.protocol === 'https:' ? 'https' : 'http') + "://www.youtube.com/player_api";
//     var before = document.getElementsByTagName("script")[0];
//     before.parentNode.insertBefore(s, before);
// })();

var players = [];
var playerIDs = [];

function onYTStateChange(event) {
    /**
     * track playing event
     * var event.data
     * -1 – unstarted
     *  0 – ended
     *  1 – playing
     *  2 – paused
     *  3 – buffering
     *  5 – video cued
     */
    if (event.data === 1 && typeof(gaTrackEvent) !== undefined) {
        var video = event.target.getVideoData();
        //console.log('YouTube_Video - Play [' + video.video_id + '] ' + video.title);
        gaTrackEvent('YouTube_Video', 'Play', '[' + video.video_id + '] ' + video.title);
    }
}

$(document).ready(function(e) {
    if($.trdx.isChinaSite()) {
        // ignore on China site
        return;
    }

    var tubes = $("iframe[src*='youtube.com']");
    if(tubes.length > 0) {
        // Load YouTube Frame API
        // and register the frames
        var s = document.createElement("script");
        s.src = (location.protocol === 'https:' ? 'https' : 'http') + "://www.youtube.com/player_api";
        var before = document.getElementsByTagName("script")[0];
        before.parentNode.insertBefore(s, before);
    }

    tubes.each(function () {
        var frameID = null;
        if (!(frameID = $(this).attr('id'))) {
            frameID = 'ytplayer-' + (playerIDs.length + 1);
            $(this).attr('id', frameID);
        }
        playerIDs.push(frameID);
        // Add function to execute when the API is ready
        YT_ready(function () {
            players.push(new YT.Player(playerIDs.shift(), {
                events: {
                    "onStateChange": onYTStateChange
                }
            }));
        });
    });
});