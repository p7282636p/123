document.addEventListener('mousemove', (e) => {
  const w = window.innerWidth;
const cw = w/2;
const h = window.innerHeight;
  const ch= h/2;

  document.documentElement.style.setProperty('--x-offset',  (e.clientX-cw)/w)
   document.documentElement.style.setProperty('--y-offset',  (e.clientY-ch)/h)
})