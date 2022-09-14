(() => {
  const elem = document.querySelector("#pdf");
  const dims = elem.getBoundingClientRect();
  elem.style.height = `${(dims.right-dims.left)*1.55}px`;
})()