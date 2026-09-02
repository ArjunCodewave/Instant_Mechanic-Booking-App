from sqlalchemy import Column , Integer , String , Boolean , Float
from src.utils.db import Base

class TaskModel(Base):
    __tablename__ = "ShoppingApp"
    product_id = Column(Integer , primary_key=True)
    name = Column(String)
    rating = Column(Float)
    distance = Column(Float)
    location = Column(String)
    isOpen = Column(Boolean, default=True)
    experience = Column(Integer)
    no_of_services = Column(Integer)
    no_of_cars = Column(Integer)
    description = Column(String)
    image = Column(String)
    
   

    