from src.tasks.dtos import TaskSchema
from sqlalchemy.orm import Session
from src.tasks.models import TaskModel
from fastapi import HTTPException
def create_task(body : TaskSchema , db: Session ):

    data = body.model_dump()
    new_task = TaskModel(
    name=data["name"],
    rating=data["rating"],
    distance=data["distance"],
    location=data["location"],
    isOpen=data["isOpen"],
    experience=data["experience"],
    no_of_services=data["no_of_services"],
    no_of_cars=data["no_of_cars"],
    description=data["description"],
    image=data["image"]
    
        )
    db.add(new_task) # preapering row 
    db.commit()
    db.refresh(new_task)


    return {"status" : "Task Created Successfully.", "data":new_task}

def get_tasks(db:Session):
    tasks = db.query(TaskModel).all()
    return{"status":"All Task","data":tasks}

def update_task(body : TaskSchema , product_id:int ,db:Session):
    one_task = db.query(TaskModel).get(product_id)
    if not one_task:
        raise HTTPException(404 , detail="Task Id is Incorrect")
    
    body = body.model_dump()
    for field , value in body.items():
        setattr(one_task , field,value)
    
    # one_task.name = body.name
    # one_task.description = body.description
    # one_task.discount = body.discount
    # one_task.availability = body.availability
    # one_task.brand = body.brand
    # one_task.image = body.image
    # one_task.price = body.price
    # one_task.unit = body.unit
    # one_task.category = body.category
    # one_task.rating = body.rating
    db.add(one_task)
    db.commit()
    db.refresh(one_task)

    return {"sttaus" : "Task Updated Successfully" , "data":one_task}

def delete_task(product_id:int,db:Session):
    one_task = db.query(TaskModel).get(product_id)
    if not one_task:
        raise HTTPException(404 , detail="Task Id is Incorrect")
    db.delete(one_task)
    db.commit()

    return{"status":"Task is deleted"}






