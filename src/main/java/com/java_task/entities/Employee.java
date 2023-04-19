package com.java_task.entities;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="employees",uniqueConstraints = {@UniqueConstraint(columnNames = {"email"})})
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@NotNull
	private String name;
	@NotNull@Email
	private String email;
	@JsonFormat(pattern = "dd/MM/yyyy")
	private Date dob;
	@NotNull
	private int age;
	@NotNull
	private double salary;
	
	private boolean status;
	
	public Employee() {}
	
	
	public Employee(long id, String name, String email, Date dob, int age, double salary, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.dob = dob;
		this.age=age;
		this.salary = salary;
		this.status = status;
	}
	public void setId(long id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public long getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public Date getDob() {
		return dob;
	}
	public int getAge() {
		return age;
	}
	public double getSalary() {
		return salary;
	}
	public boolean isStatus() {
		return status;
	}
	
	
}
