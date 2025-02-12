from fastapi import APIRouter
from api.routes import books

# Create a new API router instance.
api_router = APIRouter()

# Include the router defined in the books module.
# - prefix="/books" means all endpoints in books.router will be accessed under the /books path.
# - tags=["books"] adds a metadata tag to these endpoints in the automatically generated API docs.
api_router.include_router(books.router, prefix="/books", tags=["books"])

