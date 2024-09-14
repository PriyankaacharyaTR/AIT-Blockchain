document.addEventListener('DOMContentLoaded', function() {
    const loginModal = document.getElementById('loginModal');
    const signupModal = document.getElementById('signupModal');
    const loginBtn = document.querySelector('.login-btn');
    const signupBtn = document.querySelector('.signup-btn');
    const loginClose = loginModal.querySelector('.close');
    const signupClose = signupModal.querySelector('.close');
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mobileMenu = document.querySelector('.mobile-menu');
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');
    const uploadArea = document.getElementById('uploadArea');
    const fileInput = document.getElementById('fileInput');

    // Open login modal
    loginBtn.addEventListener('click', function(event) {
        event.preventDefault();
        loginModal.style.display = 'flex';
    });

    // Close login modal
    loginClose.addEventListener('click', function() {
        loginModal.style.display = 'none';
    });

    // Open signup modal
    signupBtn.addEventListener('click', function(event) {
        event.preventDefault();
        signupModal.style.display = 'flex';
    });

    // Close signup modal
    signupClose.addEventListener('click', function() {
        signupModal.style.display = 'none';
    });

    // Close modal when clicking outside
    window.addEventListener('click', function(event) {
        if (event.target == loginModal) {
            loginModal.style.display = 'none';
        } else if (event.target == signupModal) {
            signupModal.style.display = 'none';
        }
    });

    // Mobile menu toggle
    mobileMenuBtn.addEventListener('click', function() {
        mobileMenu.style.display = mobileMenu.style.display === 'flex' ? 'none' : 'flex';
    });

    // Handle login form submission
    loginForm.addEventListener('submit', function(event) {
        event.preventDefault();
        // Here you would normally validate and send login data to server
        // For demonstration purposes, we'll assume login is successful
        window.location.href = 'index2.html';
    });

    // Handle signup form submission
    signupForm.addEventListener('submit', function(event) {
        event.preventDefault();
        // Here you would normally validate and send signup data to server
        // For demonstration purposes, we'll assume signup is successful
        window.location.href = 'index2.html';
    });

    // File upload functionality
    uploadArea.addEventListener('click', () => {
        fileInput.click();
    });

    uploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadArea.style.borderColor = '#4285F4';
    });

    uploadArea.addEventListener('dragleave', () => {
        uploadArea.style.borderColor = '#ccc';
    });

    uploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        uploadArea.style.borderColor = '#4285F4';
        handleFiles(e.dataTransfer.files);
    });

    fileInput.addEventListener('change', (e) => {
        handleFiles(e.target.files);
    });

    function handleFiles(files) {
        if (files.length > 0) {
            const file = files[0];
            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    uploadArea.innerHTML = `<img src="${e.target.result}" style="max-width: 100%; max-height: 200px;">`;
                };
                reader.readAsDataURL(file);
            } else {
                alert('Please upload an image file.');
            }
        }
    }
});
