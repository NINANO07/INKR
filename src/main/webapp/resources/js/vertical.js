

/*.iwrapper {
    overflow: hidden;
    height: 400px; 
    position: relative;
}

.carousel {
    display: flex;
    flex-direction: column; 
    transition: transform 0.3s;
    overflow-y: auto;
    scroll-behavior: smooth;
}

.cardChart {
    height: 100px; 
    margin-bottom: 10px; 
}

.iwrapper {
    height: 1400px;
    width: 480px; 
    position: relative;
    overflow: hidden;
}

.iwrapper .carousel {
    display: flex;
    flex-direction: column; 
    overflow-y: auto;
    scroll-snap-type: y mandatory;
    gap: 16px;
    border-radius: 8px;
    scroll-behavior: smooth;
    scrollbar-width: none;
}

.carousel::-webkit-scrollbar {
    display: none;
}

.carousel.no-transition {
    scroll-behavior: auto;
}

.carousel.dragging {
    scroll-snap-type: none;
    scroll-behavior: auto;
}

.carousel.dragging .cardChart {
    cursor: grab;
    user-select: none;
}

.carousel :where(.cardChart, .chartImg) {
    display: flex;
    justify-content: center;
    align-items: center;
}

.carousel .cardChart {
    scroll-snap-align: start;
    width: 460px; 
    padding: 25px 0;
    list-style: none;
    background: linear-gradient(135deg, rgba(255,255,255,0.2), rgba(255,255,255,0));
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.25);
    border-bottom: 0;
    border-radius: 15px;
    box-shadow: 3px 3px 6px 3px rgba(0,0,0,0.2);
    cursor: pointer;
    padding-bottom: 15px;
    flex-direction: column;
    justify-content: flex-start;
    text-align: left;
}

.carousel .cardChart .chartImg {
    width: 250px;
    height: 250px;
    flex: 2;
}

.carousel .cardChart .chartText {
    border-radius: 8px;
    margin: 0 30px;
    flex: 1;
}

.cardChart .chartImg img {
    max-width: 99%;
    max-height: 99%;
    width: auto;
    height: auto;
    object-fit: cover;
    border-radius: 8px;
}

*/


function initializeCarousel(){
    const iwrapper = document.querySelector(".iwrapper");
    const carousel = document.querySelector(".carousel");
    const firstCardHeight = carousel.querySelector(".cardChart").offsetHeight;
    const carouselChildren = [...carousel.children];

    let isDragging = false, isAutoPlay = true, startY, startScrollTop, timeoutId;

    let cardPerView = Math.round(carousel.offsetHeight / firstCardHeight);

    carouselChildren.slice(-cardPerView).reverse().forEach(card => {
        carousel.insertAdjacentHTML("afterbegin", card.outerHTML);
    });

    carouselChildren.slice(0, cardPerView).forEach(card => {
        carousel.insertAdjacentHTML("beforeend", card.outerHTML);
    });

    carousel.classList.add("no-transition");
    carousel.scrollTop = carousel.offsetHeight;
    carousel.classList.remove("no-transition");

    const dragStart = (e) => {
        isDragging = true;
        carousel.classList.add("dragging");
        startY = e.pageY;
        startScrollTop = carousel.scrollTop;
    }

    const dragging = (e) => {
        if (!isDragging) return;
        carousel.scrollTop = startScrollTop - (e.pageY - startY);
    }

    const dragStop = () => {
        isDragging = false;
        carousel.classList.remove("dragging");
    }

    const infiniteScroll = () => {
        if (carousel.scrollTop === 0) {
            carousel.classList.add("no-transition");
            carousel.scrollTop = carousel.scrollHeight - (2 * carousel.offsetHeight);
            carousel.classList.remove("no-transition");
        }
        else if (Math.ceil(carousel.scrollTop) === carousel.scrollHeight - carousel.offsetHeight) {
            carousel.classList.add("no-transition");
            carousel.scrollTop = carousel.offsetHeight;
            carousel.classList.remove("no-transition");
        }

        clearTimeout(timeoutId);
        if (!iwrapper.matches(":hover")) autoPlay();
    }

    const autoPlay = () => {
        if (window.innerWidth < 800 || !isAutoPlay) return;
        timeoutId = setTimeout(() => carousel.scrollTop += firstCardHeight, 2000);
    }
    autoPlay();

    carousel.addEventListener("mousedown", dragStart);
    carousel.addEventListener("mousemove", dragging);
    document.addEventListener("mouseup", dragStop);
    carousel.addEventListener("scroll", infiniteScroll);
    iwrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
    iwrapper.addEventListener("mouseleave", autoPlay);
}

initializeCarousel();


function initializeCarousel() {
    const iwrapper = document.querySelector(".iwrapper");
    const carousel = document.querySelector(".carousel");
    const firstCardHeight = carousel.querySelector(".cardChart").offsetHeight;
    const carouselChildren = [...carousel.children];

    let isDragging = false, isAutoPlay = true, startY, startScrollTop, timeoutId;

    let cardPerView = Math.round(carousel.offsetHeight / firstCardHeight);

    carouselChildren.slice(-cardPerView).reverse().forEach(card => {
        carousel.insertAdjacentHTML("afterbegin", card.outerHTML);
    });

    carouselChildren.slice(0, cardPerView).forEach(card => {
        carousel.insertAdjacentHTML("beforeend", card.outerHTML);
    });

    carousel.classList.add("no-transition");
    carousel.scrollTop = carousel.offsetHeight;
    carousel.classList.remove("no-transition");

    const dragStart = (e) => {
        isDragging = true;
        carousel.classList.add("dragging");
        startY = e.pageY;
        startScrollTop = carousel.scrollTop;
    }

    const dragging = (e) => {
        if (!isDragging) return;
        carousel.scrollTop = startScrollTop - (e.pageY - startY);
    }

    const dragStop = () => {
        isDragging = false;
        carousel.classList.remove("dragging");
    }

    const infiniteScroll = () => {
        if (carousel.scrollTop === 0) {
            carousel.classList.add("no-transition");
            carousel.scrollTop = carousel.scrollHeight - (2 * carousel.offsetHeight);
            carousel.classList.remove("no-transition");
        }
        else if (Math.ceil(carousel.scrollTop) === carousel.scrollHeight - carousel.offsetHeight) {
            carousel.classList.add("no-transition");
            carousel.scrollTop = carousel.offsetHeight;
            carousel.classList.remove("no-transition");
        }

        clearTimeout(timeoutId);
        if (!iwrapper.matches(":hover")) autoPlay();
    }

    const autoPlay = () => {
        if (window.innerWidth < 800 || !isAutoPlay) return;
        timeoutId = setTimeout(() => carousel.scrollTop += firstCardHeight, 2000);
    }
    autoPlay();

    carousel.addEventListener("mousedown", dragStart);
    carousel.addEventListener("mousemove", dragging);
    document.addEventListener("mouseup", dragStop);
    carousel.addEventListener("scroll", infiniteScroll);
    iwrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
    iwrapper.addEventListener("mouseleave", autoPlay);
}

initializeCarousel();

document.addEventListener("DOMContentLoaded", () => {
    function initializeCarousel() {
        const iwrapper = document.querySelector(".iwrapper");
        const carousel = document.querySelector(".carousel");
        const firstCardWidth = carousel.querySelector(".cardChart").offsetWidth;
        const carouselChildren = [...carousel.children];

        let isDragging = false, isAutoPlay = true, startX, startScrollLeft, timeoutId;

        // Check the number of cards
        let cardCount = carouselChildren.length;
        if (cardCount > 1) {
            let cardPerView = Math.round(carousel.offsetWidth / firstCardWidth);

            // Clone elements for infinite scroll
            carouselChildren.slice(-cardPerView).reverse().forEach(card => {
                carousel.insertAdjacentHTML("afterbegin", card.outerHTML);
            });

            carouselChildren.slice(0, cardPerView).forEach(card => {
                carousel.insertAdjacentHTML("beforeend", card.outerHTML);
            });

            // Initial scroll position
            carousel.classList.add("no-transition");
            carousel.scrollLeft = carousel.offsetWidth;
            carousel.classList.remove("no-transition");
        }

        const dragStart = (e) => {
            isDragging = true;
            carousel.classList.add("dragging");
            startX = e.pageX;
            startScrollLeft = carousel.scrollLeft;
        };

        const dragging = (e) => {
            if (!isDragging) return;
            carousel.scrollLeft = startScrollLeft - (e.pageX - startX);
        };

        const dragStop = () => {
            isDragging = false;
            carousel.classList.remove("dragging");
        };

        const infiniteScroll = () => {
            if (cardCount > 1) {
                if (carousel.scrollLeft === 0) {
                    carousel.classList.add("no-transition");
                    carousel.scrollLeft = carousel.scrollWidth - (2 * carousel.offsetWidth);
                    carousel.classList.remove("no-transition");
                } else if (Math.ceil(carousel.scrollLeft) === carousel.scrollWidth - carousel.offsetWidth) {
                    carousel.classList.add("no-transition");
                    carousel.scrollLeft = carousel.offsetWidth;
                    carousel.classList.remove("no-transition");
                }

                clearTimeout(timeoutId);
                if (!iwrapper.matches(":hover")) autoPlay();
            }
        };

        const autoPlay = () => {
            if (cardCount > 1) {
                //if (window.innerWidth < 800 || !isAutoPlay) return;
                timeoutId = setTimeout(() => carousel.scrollLeft += firstCardWidth, 2000);
            }
        };
        autoPlay();

        carousel.addEventListener("mousedown", dragStart);
        carousel.addEventListener("mousemove", dragging);
        document.addEventListener("mouseup", dragStop);
        carousel.addEventListener("scroll", infiniteScroll);
        iwrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
        iwrapper.addEventListener("mouseleave", autoPlay);
    }

    initializeCarousel();
});


/* grid-auto-columns: var(--card-width, calc((100% / 4) - 12px));*/

document.addEventListener("DOMContentLoaded", () => {
    function initializeCarousel() {
        const iwrapper = document.querySelector(".iwrapper");
        const carousel = document.querySelector(".carousel");
        let carouselChildren = [...carousel.children];

        let isDragging = false, isAutoPlay = true, startX, startScrollLeft, timeoutId;

        let cardCount = carouselChildren.length;

        const setCarousel = () => {
            let containerWidth = carousel.offsetWidth;
            let cardPerView = Math.floor(containerWidth / 300); // Assuming 300px is the approximate width of each card
            let cardWidth = containerWidth / cardPerView;

            document.documentElement.style.setProperty('--card-width', `${cardWidth}px`);

            // Clear existing carousel content
            carousel.innerHTML = '';
            carouselChildren = [...carouselChildren.slice(0, cardCount)];

            // Clone elements for infinite scroll
            carouselChildren.slice(-cardPerView).reverse().forEach(card => {
                carousel.insertAdjacentHTML("afterbegin", card.outerHTML);
            });

            carouselChildren.forEach(card => {
                carousel.insertAdjacentHTML("beforeend", card.outerHTML);
            });

            // Initial scroll position
            carousel.classList.add("no-transition");
            carousel.scrollLeft = carousel.offsetWidth;
            carousel.classList.remove("no-transition");
        };

        const dragStart = (e) => {
            isDragging = true;
            carousel.classList.add("dragging");
            startX = e.pageX;
            startScrollLeft = carousel.scrollLeft;
        };

        const dragging = (e) => {
            if (!isDragging) return;
            carousel.scrollLeft = startScrollLeft - (e.pageX - startX);
        };

        const dragStop = () => {
            isDragging = false;
            carousel.classList.remove("dragging");
        };

        const infiniteScroll = () => {
            if (cardCount > 1) {
                if (carousel.scrollLeft === 0) {
                    carousel.classList.add("no-transition");
                    carousel.scrollLeft = carousel.scrollWidth - (2 * carousel.offsetWidth);
                    carousel.classList.remove("no-transition");
                } else if (Math.ceil(carousel.scrollLeft) === carousel.scrollWidth - carousel.offsetWidth) {
                    carousel.classList.add("no-transition");
                    carousel.scrollLeft = carousel.offsetWidth;
                    carousel.classList.remove("no-transition");
                }

                clearTimeout(timeoutId);
                if (!iwrapper.matches(":hover")) autoPlay();
            }
        };

        const autoPlay = () => {
            if (cardCount > 1) {
                // if (window.innerWidth < 800 || !isAutoPlay) return;
                timeoutId = setTimeout(() => carousel.scrollLeft += carousel.querySelector(".cardChart").offsetWidth, 2000);
            }
        };

        window.addEventListener('resize', setCarousel);

        autoPlay();

        carousel.addEventListener("mousedown", dragStart);
        carousel.addEventListener("mousemove", dragging);
        document.addEventListener("mouseup", dragStop);
        carousel.addEventListener("scroll", infiniteScroll);
        iwrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
        iwrapper.addEventListener("mouseleave", autoPlay);

        // Initial setup
        setCarousel();
    }

    initializeCarousel();
});
