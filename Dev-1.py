
from fastapi import FastAPI




users_db = {}

def signup(user):
    required_fields = ["firstname", "lastname", "email", "username", "password", "confirmpassword"]
    for field in required_fields:
        if field not in user:
            return {"error": f"{field} is required"}
        
    if not user["firstname"].isalpha() or len(user["firstname"]) > 100:
        return {"error": "Firstname must contain only alphabets and be at most 100 characters long"}
    
    if not user["lastname"].isalpha() or len(user["lastname"]) > 100:
        return {"error": "Lastname must contain only alphabets and be at most 100 characters long"}
    
    if user["username"] in users_db:
        return {"error": "Username already exists"}
    
    if user["password"] != user["confirm password"]:
        return {"error": "Passwords do not match"}
    
    if len(user["password"]) > 200:
        return {"error": "Password is too long"}
    
    if "@" not in user["email"]:
        return {"error": "Email must contain '@' symbol"}
    
    return {"success": "User created successfully"}
    

def login(credentials):
    username = credentials.get("username")
    password = credentials.get("password")

    user = users_db.get(username)
    if not user or user["password"] != password:
        return {"error": "Invalid username or password"}
    return {"Login successful"}

