document.addEventListener("click", function (e) {
    if(e.target.classList.contains("deroulant-action"))
        document.getElementById("deroulant-options").style.display = "block";
    else
        document.getElementById("deroulant-options").style.display = "none";
}, false);