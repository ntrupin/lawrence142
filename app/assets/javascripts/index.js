(() => {
  let check = () => {
    const sel = document.querySelector(".instagram-media-rendered");
    if (sel != null) {
      sel.classList.remove("d-lg-none");
      sel.classList.add("d-lg-block");
    } else {
      setTimeout(check, 30);
    }
  };
  
  check();
})();