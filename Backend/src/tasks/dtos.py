from pydantic import BaseModel

class TaskSchema(BaseModel):
    name: str
    rating: float
    distance: float
    location: str
    isOpen: bool
    experience: int
    no_of_services: int
    no_of_cars: int
    description: str
    image : str
    


