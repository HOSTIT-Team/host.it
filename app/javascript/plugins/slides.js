// const initSlides = () => {
//     const slides = document.querySelectorAll("div.guest-cards")

//     let current = 0
//     let z = 0

//     const images = slides.querySelectorAll("img")

//     images.forEach(image => {
//         z = z - 1
//         image.style.zIndex = z
//     })

//     // gsap.set(images, { opacity: 0 })

//     // imagesLoaded(images, function () {
//     //     const timeline = gsap.timeline()
//     //     timeline
//     //         .set(images, {
//     //             x: () => {
//     //                 return 500 * Math.random() - 250
//     //             },
//     //             y: "500%",
//     //             rotation: () => {
//     //                 return 90 * Math.random() - 45
//     //             },
//     //             opacity: 1
//     //         })
//     //         .to(images, { x: 0, y: 0, stagger: -0.25 })
//     //         .to(images, {
//     //             rotation: () => {
//     //                 return 16 * Math.random() - 8
//     //             }
//     //         })
//     // })

//     slides.addEventListener("click", function () {
//         z = z + 1
//         images[current].style.zIndex = z

//         // let direction = "150%"
//         // let midAngle = 15

//         // if (Math.random() > 0.5) {
//         //     direction = "-150%"
//         //     midAngle = -15
//         // }

//         // const currentImage = images[current]
//         // const flipTimeline = gsap.timeline()

//         // flipTimeline
//         //     .set(currentImage, { x: 0 })
//         //     .to(currentImage, {
//         //         x: direction,
//         //         rotation: midAngle,
//         //         rotationY: 90,
//         //         scale: 1.1
//         //     })
//         //     .set(currentImage, { zIndex: z })
//         //     .to(currentImage, {
//         //         x: 0,
//         //         rotation: () => {
//         //             return 16 * Math.random() - 8
//         //         },
//         //         rotationY: 0,
//         //         scale: 1
//         //     })
//         current = current + 1
//         current = current % images.length
//     })
// };
// export { initSlides };

const initSlides = () => {
    if (document.querySelector("div.guest-cards")) {
        const slideArea = document.querySelector("div.guest-cards");
        const images = slideArea.querySelectorAll("img");

        let currentSlide = 0;
        let z = 1;

        slideArea.addEventListener("click", function () {
            currentSlide = currentSlide + 1;

            if (currentSlide > images.length - 1) {
                currentSlide = 0;
            }

            z = z + 1;

            images.forEach((image) => {
                image.style.animation = "";
            });

            images[currentSlide].style.zIndex = z;
            // images[currentSlide].style.animation = "fade 0.5s";
        });

        // slideArea.addEventListener("mouseover", function () {
        //     images.forEach((image) => {
        //         const x = 25 * Math.floor(Math.random() * 5) - 50;
        //         const y = 25 * Math.floor(Math.random() * 5) - 50;

        //         image.style.transform = `translate(${x}px, ${y}px)`;
        //     });
        // });

        // slideArea.addEventListener("mouseout", function () {
        //     images.forEach((image) => {
        //         image.style.transform = "";
        //     });
        // });
    }
};
export { initSlides };