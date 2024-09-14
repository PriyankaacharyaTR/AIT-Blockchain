<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GIIX Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .navbar {
            width: 100%;
            background-color: #1a73e8;
            color: white;
            padding: 0.5rem 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .navbar .logo {
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin: 0 0.5rem;
        }

        .nav-links button {
            background: transparent;
            border: 1px solid white;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 1rem;
            margin-top: 1rem;
        }

        h1 {
            color: #1a73e8;
            text-align: center;
            margin-bottom: 1rem;
        }

        .upload-area {
            border: 2px dashed #4285F4;
            border-radius: 8px;
            padding: 1rem;
            text-align: center;
            margin-bottom: 1rem;
            cursor: pointer;
        }

        .upload-icon {
            font-size: 2rem;
        }

        .features, .smart-buttons {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 1rem;
        }

        .feature, .smart-button {
            background-color: #e8f0fe;
            border: 1px solid #dadce0;
            border-radius: 8px;
            padding: 0.5rem;
            margin: 0.5rem;
            text-align: center;
            width: 100px;
        }

        .feature-icon, .smart-button span {
            font-size: 1.5rem;
        }

        .smart-button {
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .smart-button:hover {
            background-color: #1a73e8;
            color: white;
        }

        #main {
            padding: 1rem;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 1rem;
        }

        input[type="text"] {
            width: calc(100% - 1.6rem);
            padding: 0.5rem;
            margin-bottom: 0.5rem;
            border: 1px solid #dadce0;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            background-color: #1a73e8;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1557b0;
        }

        #identityResult {
            margin-top: 0.5rem;
            padding: 0.5rem;
            background-color: #e8f0fe;
            border-radius: 4px;
            color: #1a73e8;
        }

        @media (max-width: 600px) {
            .navbar, .container {
                width: 100%;
            }

            .features, .smart-buttons {
                flex-direction: column;
                align-items: center;
            }

            .feature, .smart-button {
                width: 80%;
                margin: 0.5rem 0;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo">GIIX</a>
        <div class="nav-links">
            <a href="#">Dashboard</a>
            <a href="#">Profile</a>
            <a href="#">Settings</a>
            <button class="logout-btn">Logout</button>
        </div>
    </nav>

    <div class="container">
        <h1>Welcome to GIIX Dashboard</h1>

        <div class="upload-area" id="uploadArea">
            <div class="upload-icon">&#8593;</div>
            <div class="upload-text">Click or drag image to upload</div>
        </div>

        <button class="google-scan-btn" id="uploadButton">
            <span>&#128247;</span> Upload
        </button>

        <input type="file" id="fileInput" style="display: none;" accept="image/*">



        <div id="main">
            <h2>Identity Management</h2>

            <div id="register">
                <h3>Register Identity</h3>
                <input type="text" id="attributeValue" placeholder="Attribute Value">
                <input type="text" id="attributeType" placeholder="Attribute Type">
                <button onclick="registerIdentity()">Register</button>
            </div>

            <div id="update">
                <h3>Update Identity</h3>
                <input type="text" id="updateValue" placeholder="Attribute Value">
                <input type="text" id="updateType" placeholder="Attribute Type">
                <button onclick="updateIdentity()">Update</button>
            </div>

            <div id="verify">
                <h3>Verify Attribute</h3>
                <input type="text" id="verifyAddress" placeholder="User Address">
                <input type="text" id="verifyType" placeholder="Attribute Type">
                <button onclick="verifyAttribute()">Verify</button>
            </div>

            <div id="get">
                <h3>Get Identity</h3>
                <input type="text" id="getAddress" placeholder="User Address">
                <input type="text" id="getType" placeholder="Attribute Type">
                <button onclick="getIdentity()">Get Attribute</button>
                <p id="identityResult"></p>
            </div>
        </div>

        <div class="smart-buttons">
            <button class="smart-button" onclick="window.location.href='edu.html'">Educational</button>
            <button class="smart-button" onclick="window.location.href='res.html'">Residential</button>
            <button class="smart-button" onclick="window.location.href='med.html'">Healthcare</button>
            <button class="smart-button" onclick="window.location.href='fin.html'">Financial</button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const uploadArea = document.getElementById('uploadArea');
            const fileInput = document.getElementById('fileInput');
            const uploadButton = document.getElementById('uploadButton');

            uploadArea.addEventListener('click', () => {
                fileInput.click();
            });

            uploadArea.addEventListener('dragover', (e) => {
                e.preventDefault();
                uploadArea.style.borderColor = '#4285F4';
            });

            uploadArea.addEventListener('dragleave', () => {
                uploadArea.style.borderColor = '#4285F4';
            });

            uploadArea.addEventListener('drop', (e) => {
                e.preventDefault();
                uploadArea.style.borderColor = '#4285F4';
                handleFiles(e.dataTransfer.files);
            });

            fileInput.addEventListener('                change', (e) => {
                handleFiles(e.target.files);
            });

            uploadButton.addEventListener('click', () => {
                fileInput.click();
            });

            function handleFiles(files) {
                const file = files[0];
                if (file) {
                    uploadFile(file);
                }
            }

            function uploadFile(file) {
                // Upload logic here
                console.log(`Uploading ${file.name}`);
            }
        });

        // Registration, Update, Verification, and Get Identity functions
        async function registerIdentity() {
            const value = document.getElementById('attributeValue').value;
            const type = document.getElementById('attributeType').value;
            if (!value || !type) {
                alert("Please fill all fields.");
                return;
            }
            console.log(`Registering identity - Value: ${value}, Type: ${type}`);
            // Add IPFS/Blockchain integration here.
        }

        async function updateIdentity() {
            const value = document.getElementById('updateValue').value;
            const type = document.getElementById('updateType').value;
            if (!value || !type) {
                alert("Please fill all fields.");
                return;
            }
            console.log(`Updating identity - Value: ${value}, Type: ${type}`);
            // Add update logic here
        }

        async function verifyAttribute() {
            const address = document.getElementById('verifyAddress').value;
            const type = document.getElementById('verifyType').value;
            if (!address || !type) {
                alert("Please fill all fields.");
                return;
            }
            console.log(`Verifying identity - Address: ${address}, Type: ${type}`);
            // Add verification logic here
        }

        async function getIdentity() {
            const address = document.getElementById('getAddress').value;
            const type = document.getElementById('getType').value;
            if (!address || !type) {
                alert("Please fill all fields.");
                return;
            }
            console.log(`Fetching identity - Address: ${address}, Type: ${type}`);
            // Add retrieval logic here and update the result in the UI
            document.getElementById('identityResult').textContent = "Identity retrieved: " + address + ", " + type;
        }
    </script>
</body>
</html>

