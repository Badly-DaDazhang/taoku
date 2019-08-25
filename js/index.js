var i = 0;
var liwidth = "100%";
var duratton = 500;
var liCount = 4;
var ulList = document.getElementById("fullScreenSlides");
var pagination = document.getElementsByClassName("full-screen-slides-pagination");

var lis = ulList.children;

function moveTo(to) {
    if (to == undefined) { to = i + 1 };
    if (i == 0) {
        if (to > i) {
            ulList.className = "transition";
        } else {
            ulList.className = "";
            ulList.style.marginLeft = -liwidth * liCount;
        }
    }
}