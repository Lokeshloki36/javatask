package com.java_task.service;

import java.util.List;

import com.java_task.entities.Employee;
import com.java_task.payload.PostResponse;

public interface EmployeeService {
	public void saveEmployee(Employee employee);
	public PostResponse showAllEmployees(int pageNo,int pageSize);
	public List<Employee> showAllEmployees();
	public void deleteById(long id);
	public Employee updateEmployee(long id);
	public List<Employee> searchByName(String name);
}
