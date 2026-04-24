from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import psycopg2
from psycopg2.extras import RealDictCursor
from dotenv import load_dotenv
import os
load_dotenv()

app = FastAPI()

conn = psycopg2.connect(
    host="localhost",
    database="gym_app",
    user="gregoire",
    password=os.getenv("DB_MDP")
)

@app.get("/users/{user_id}")
def get_user(user_id: int):
    with conn.cursor(cursor_factory=RealDictCursor) as curs:
        curs.execute(
            """
            SELECT id, name, profession, bio
            FROM users
            WHERE id = %s
            """,
            (user_id,)
        )
        user = curs.fetchone()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user


class UserCreate(BaseModel):
    name: str
    profession: str | None = None
    bio: str | None = None

@app.post("/users/")
def create_user(user: UserCreate):
    with conn.cursor(cursor_factory=RealDictCursor) as curs:
        curs.execute(
            """
            INSERT INTO users (name, profession, bio) \
            VALUES (%s, %s, %s) \
            RETURNING id
            """,
            (user.name, user.profession, user.bio)
        )
        new_user = curs.fetchone()
    conn.commit()
    return new_user


class LoginData(BaseModel):
    name: str

@app.post("/login/")
def login(data: LoginData):
    with conn.cursor(cursor_factory=RealDictCursor) as curs:
        curs.execute(
            "SELECT * FROM users WHERE name = %s",
            (data.name,)
        )
        user = curs.fetchone()

    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    return user