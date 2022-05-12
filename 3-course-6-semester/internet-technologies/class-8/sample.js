/* addEventListener - метод позволяющий добавить обработчик событий */


function toggleClass(event) {
    const el = event.target;
    const value = el.classList.value;
    switch (value) {
        case "":
            el.classList.add("square");
            break;
        case "square":
            el.classList.add("circle");
            el.classList.remove("square");
            break;
        case "circle":
            el.classList.remove("circle")
            break;
        default:
            console.log(value)
    }
}


function createObject(text) {
    const el = document.createElement("div");
    el.addEventListener("click", toggleClass);
    el.innerHTML = text;
    return el;
}


function onLoaded() {
    var i = 1;
    const els = document.querySelectorAll(".container > div");
    const containers = document.querySelectorAll(".container");
    for (let j = 1; j < containers.length + 1; j++) {
        for (; i < els.length + 1; i++) {
            els[i-1].addEventListener("click", toggleClass);
            els[i-1].innerHTML = `${i} ${j}`;
        }
    }
    i -= containers.length;

    const btn = document.querySelector("#add");
    btn.addEventListener("click", () => {
        i++;
        const containers = document.querySelectorAll(".container");
        for (let j = 0; j < containers.length; j++) {
            const el = createObject(`${j+1} ${i}`);
            containers[j].appendChild(el);
        }
    });
}


function fromFirstToSecond() {
    const circles = document.querySelectorAll(".first > .circle");
    const secondContainer = document.querySelector(".container.second");
    for (const circle of circles) {
        const el = createObject(circle.innerHTML);
        el.classList.add("circle");
        secondContainer.appendChild(el);
        circle.remove();
    }
}


function fromSecondToFirst() {
    const squares = document.querySelectorAll(".second > .square");
    const firstContainer = document.querySelector(".container.first");
    for (const square of squares) {
        const el = createObject(square.innerHTML);
        el.classList.add("square");
        firstContainer.appendChild(el);
        square.remove();
    }
}


document.addEventListener("DOMContentLoaded", onLoaded);