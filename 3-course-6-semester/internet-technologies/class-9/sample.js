var card = null;
var startX = 0;
var startY = 0;
var origTop = null;
var origLeft = null;
var isMoving = false;


function mouseDown(event) {
    if (event.target.classList.contains("card")) {
        card  = event.target;
        startX = event.offsetX;
        startY = event.offsetY;
        origTop = card.clientTop;
        origLeft = card.clientLeft;
        isMoving = true;
    }
}


function mouseMove(event) {
    if (isMoving) {
        card.style.top = origTop + (event.offsetY - startY) + "px";
        card.style.left = origLeft + (event.offsetX - startX) + "px";
    }
}


function mouseUp(event) {
    if (card && isMoving) {
        card = null;
        isMoving = false;
    }
}


function onLoaded() {
    const container = document.querySelector(".container");
    container.addEventListener("mousedown", mouseDown);
    container.addEventListener("mousemove", mouseMove);
    container.addEventListener("mouseup", mouseUp);
}


document.addEventListener("DOMContentLoaded", onLoaded);