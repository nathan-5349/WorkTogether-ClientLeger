document.addEventListener('DOMContentLoaded', () => {
    const langBtn = document.getElementById('langBtn');
    const langMenu = document.getElementById('langMenu');
    const burgerBtn = document.getElementById('burgerBtn');
    const navLinks = document.getElementById('navLinks');

    if (langBtn && langMenu) {
        langBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            langMenu.classList.toggle('is-active');
            navLinks.classList.remove('is-active');
            burgerBtn.classList.remove('open');
        });
    }

    if (burgerBtn && navLinks) {
        burgerBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            burgerBtn.classList.toggle('open');
            navLinks.classList.toggle('is-active');
            langMenu.classList.remove('is-active');
        });
    }

    document.addEventListener('click', (e) => {
        if (langMenu && !e.target.closest('.wt-dropdown')) {
            langMenu.classList.remove('is-active');
        }
        if (navLinks && !e.target.closest('#navLinks') && !e.target.closest('#burgerBtn')) {
            navLinks.classList.remove('is-active');
            burgerBtn.classList.remove('open');
        }
    });

    if (langMenu) {
        langMenu.addEventListener('click', (e) => e.stopPropagation());
    }
});
