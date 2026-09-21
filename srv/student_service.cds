using {student.db as model} from '../db/schema'; //Importing tale using namespace created in db folder

service studentAPIService{
    entity StudentSet as projection on model.Students; //Entityset created using table structure:Students

}

service scourseAPIService{
    entity CourseSet as projection on model.Courses; //Entityset created using table structure:Students
    
}
