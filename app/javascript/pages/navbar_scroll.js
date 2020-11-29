const navbarScroll = () => {
  const navbar = document.querySelector(".navbar-hostit");
  const navLine = navbar.querySelector(".nav-line");
  const logo = navLine.querySelector(".navbar-brand img");
  const avatar = navLine.querySelector(".avatar-card");
  const dropDown = navLine.querySelector(".avatar-dropdown");

  // const scrollFunction = () => {
  //   if (
  //     document.body.scrollTop > 120 ||
  //     document.documentElement.scrollTop > 120
  //   ) {
  //     navbar.style.height = "80px";
  //     navLine.style.height = "100%";
  //     navLine.style.alignItems = "center";
  //     logo.style.height = "60px";
  //     logo.style.marginTop = "0";
  //     avatar.style.marginTop = "0!important";
  //     avatar.style.height = "60px";
  //     avatar.style.width = "45px";
  //     dropDown.style.justifyContent = "center";
  //   } else {
  //     navbar.style.height = "120px";
  //     navLine.style.height = "36px";
  //     logo.style.height = "100px";
  //     logo.style.marginTop = "0";
  //     avatar.style.marginTop = "-20px";
  //     avatar.style.height = "80px";
  //     avatar.style.width = "60px";
  //     dropDown.style.justifyContent = "center";
  //   }
  // };

  // window.onscroll = function () {
  //   scrollFunction();
  // };
};

export { navbarScroll };
