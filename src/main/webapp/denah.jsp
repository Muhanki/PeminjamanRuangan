<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Denah Ruangan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8fafc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .denah-img {
            display: flex;
            justify-content: center;
        }

        .denah-img img {
            max-width: 100%;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

        .btn-back {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 18px;
            background-color: #64748b;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .btn-back:hover {
            background-color: #475569;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Denah Ruangan 101 – 108</h1>

    <div class="denah-img">
        <img src=images/denah.jpeg alt="Denah Ruangan">
    </div>

    <div style="text-align: center;">
        <a href="index.jsp" class="btn-back">⬅ Kembali</a>
    </div>
</div>

</body>
</html>
