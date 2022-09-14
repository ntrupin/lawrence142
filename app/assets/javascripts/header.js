(() => {
  const fixEvent = (elemSel, proxySel) => {
    const elem = document.querySelector(elemSel);
    const dims = elem.getBoundingClientRect();
    const proxy = document.querySelector(proxySel);
    const rect = proxy.getBoundingClientRect();
    if (rect.top <= 0 && !elem.classList.contains("fixed-top")) {
      const margin = dims.left
      elem.classList.add("fixed-top");
      elem.style.marginLeft = `${margin}px`;
      elem.style.marginRight = `${margin}px`;
      proxy.style.height = `${dims.bottom - dims.top}px`;
    } else if (rect.top > 0 && elem.classList.contains("fixed-top")) {
      elem.classList.remove("fixed-top");
      elem.style.marginLeft = ``;
      elem.style.marginRight = ``;
      proxy.style.height = 0;
    }
  };
  
 document.addEventListener("scroll", (event) => { 
    fixEvent("#navbar", "#navproxy");
    fixEvent("#accordionNav", "#accordionNavProxy")
  });
})();