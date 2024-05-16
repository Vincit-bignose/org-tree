import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()

BASE_DIR = Path(__file__).resolve().parent.parent

# DATABASE
DATABASE_ENGINE = os.getenv("DATABASE_ENGINE")

POSTGRES_DB = os.getenv("POSTGRES_DB")
POSTGRES_USER = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_HOST = os.getenv("POSTGRES_HOST")
POSTGRES_PORT = os.getenv("POSTGRES_PORT")

# CONFIG
DEBUG_ = os.getenv("DEBUG", True)
ALLOWED_HOSTS_ = os.getenv("ALLOWED_HOSTS").split(",")
SECRET_KEY_ = os.getenv("SECRET_KEY")
CORS_ALLOWED_ORIGINS_ = os.getenv("CORS_ALLOWED_ORIGINS").split(",")

