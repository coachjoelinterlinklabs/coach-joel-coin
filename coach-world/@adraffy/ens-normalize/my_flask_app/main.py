from flask import Flask, render_template, request, redirect, url_for, session, jsonify
import os
import requests

app = Flask(__name__)
app.secret_key = os.getenv("SECRET_KEY", "dev_secret_key")

# Gemini API key from Railway
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

@app.route("/")
def home():
    if "interlink_id" in session:
        return redirect(url_for("chat"))
    return redirect(url_for("login"))

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        interlink_id = request.form.get("interlink_id")
        if interlink_id:
            session["interlink_id"] = interlink_id
            return redirect(url_for("chat"))
    return render_template("login.html")

@app.route("/chat")
def chat():
    if "interlink_id" not in session:
        return redirect(url_for("login"))
    return render_template("chat.html", username=session["interlink_id"])

@app.route("/logout")
def logout():
    session.pop("interlink_id", None)
    return redirect(url_for("login"))

@app.route("/send_message", methods=["POST"])
def send_message():
    if not GEMINI_API_KEY:
        return jsonify({"reply": "⚠️ Missing Gemini API key configuration."})
    
    user_message = request.json.get("message")

    payload = {
        "contents": [
            {"role": "user", "parts": [{"text": user_message}]}
        ]
    }

    headers = {
        "Content-Type": "application/json",
        "x-goog-api-key": GEMINI_API_KEY
    }

    try:
        response = requests.post(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent",
            headers=headers,
            json=payload
        )
        data = response.json()
        reply = data.get("candidates", [{}])[0].get("content", {}).get("parts", [{}])[0].get("text", "⚠️ No response from Gemini.")
        return jsonify({"reply": reply})
    except Exception as e:
        return jsonify({"reply": f"⚠️ Error: {e}"})

if __name__ == "__main__":
    app.run(debug=True)
