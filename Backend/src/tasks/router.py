from fastapi import APIRouter , Depends
from src.tasks import controller
from src.tasks.dtos import TaskSchema
from src.utils.db import get_db

task_routes = APIRouter(prefix="/products")


@task_routes.post("/create")
def create_task(body: TaskSchema , db = Depends(get_db)):
    return controller.create_task(body , db)

@task_routes.get("/all_products")
def get_all_tasks(db = Depends(get_db)):
    return controller.get_tasks(db)

@task_routes.put("/update_task/{product_id}")
def update_task(
    body: TaskSchema,
    product_id: int,
    db=Depends(get_db)
):
    return controller.update_task(body, product_id, db)

@task_routes.delete("/delete_task/{product_id}")
def delete_task(product_id: int,
    db=Depends(get_db)):
    return controller.delete_task(product_id,
    db)