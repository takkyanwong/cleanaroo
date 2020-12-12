const fakeLoader = () => {
  if ( document.querySelector('.wrapper-faker') ) 
  {
    document.querySelector('.wrapper-faker').style.display = "none";
  }
};

export { fakeLoader };

