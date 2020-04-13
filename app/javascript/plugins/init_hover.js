const toggleVarietyHover = () => {
  const varieties = document.querySelectorAll('.variety-tree');
  const secondVarieties = document.querySelectorAll('.variety-tree');

  varieties.forEach(variety => {
    variety.addEventListener('mouseover', event => {
      secondVarieties.forEach(secondVariety => {
        if (secondVariety.innerText === event.currentTarget.innerText) {
          secondVariety.classList.add('hover');
        }
      });
    });
  });
  varieties.forEach(variety => {
    variety.addEventListener('mouseout', event => {
      secondVarieties.forEach(secondVariety => {
        if (secondVariety.innerText === event.currentTarget.innerText) {
          secondVariety.classList.remove('hover');
        }
      });
    });
  });

};

export { toggleVarietyHover };
