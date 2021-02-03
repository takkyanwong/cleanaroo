const numberDown = (selector1, selector2) => {
  const minusBtn = document.querySelector(selector1);
  if (minusBtn) {
    minusBtn.addEventListener("click", () => {
      let numDown = document.querySelector(selector2);
      numDown.stepDown();
    });
  }
};

const numberUp = (selector1, selector2) => {
  const plusBtn = document.querySelector(selector1);
  if (plusBtn) {
    plusBtn.addEventListener("click", () => {
      let numUp = document.querySelector(selector2);
      numUp.stepUp();
    });
  }
};

export { numberDown, numberUp };
