const numberDown = () => {
    const minusBtn = document.querySelectorAll("#numberDown");
    minusBtn.forEach((btnDown) => {
        btnDown.addEventListener("click", () => {
            let numDown = document.querySelectorAll("#numberRooms");
            numDown.forEach((nDown) =>{
                nDown.stepDown();
            });
        });
    });
};

const numberUp = () => {
    const plusBtn = document.querySelectorAll("#numberUp");
    plusBtn.forEach((btnUp) => {
        btnUp.addEventListener("click", () => {
            let numUp= document.querySelectorAll("#numberRooms");
            numUp.forEach((nUp) => {
                nUp.stepUp();
            });
        });
    });
};

export { numberDown, numberUp };
