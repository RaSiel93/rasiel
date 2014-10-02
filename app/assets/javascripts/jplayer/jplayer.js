var playList

$(document).ready(function(){
  playList = new jPlayerPlaylist({
      jPlayer: "#jquery_jplayer_1",
      cssSelectorAncestor: "#jp_container_1"
    }, [], {
      supplied: "mp3",
      wmode: "window"
  });
})
