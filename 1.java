import java.text.MessageFormat;

public class Worker {

// Поля класса | объекты
private String fullName; // Ф.И.О.
private String position; // Должность
private String email; // емаил
private String phone; // Телефон
private int salary; // Зарплата
private int age; // Возраст

// Конструктор
public Worker(String fullName, String position, String email, String phone, int salary, int age) {
// this. обращаемся к переменным этого же класса.
// this. Стучимся к самому классу Worker и его поле fullName
this.fullName = fullName;
this.position = position;
this.email = email;
this.phone = phone;
this.salary = salary;
this.age = age;
}

// это метод
public String workerInfo() {
String pattern = "fullName: {0}, position: {1}, email: {2}, phone: {3}, salary: {4}, age: {5}";
return MessageFormat.format(pattern, this.fullName, this.position, this.email, this.phone, this.salary, this.age);
}

public String getFullName() {
return fullName;
}
// Установить
public void setFullName(String fullName) {
this.fullName = fullName;
}

// Получить
public String getPosition() {
return position;
}

// Установить
public void setPosition(String position) {
this.position = position;
}

// и т д
public String getEmail() {
return email;
}

public void setEmail(String email) {
this.email = email;
}

// А если сделать private String getPhone - то вообще смысла от геттера нету.
public String getPhone() {
return phone;
}


public void setPhone(String phone) {
// this. Стучимся к самому классу Worker и его поле phone
this.phone = phone;
}

public int getSalary() {
return salary;
}

public void setSalary(int salary) {
this.salary = salary;
}

public int getAge() {
return age;
}

public void setAge(int age) {
this.age = age;
}
