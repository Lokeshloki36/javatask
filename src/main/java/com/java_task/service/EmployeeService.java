package com.java_task.service;

import java.util.List;

import com.java_task.entities.Employee;

public interface EmployeeService {
	public void saveEmployee(Employee employee);
	public List<Employee> showAllEmployees();
	public void deleteById(long id);
	public Employee updateEmployee(long id);
}
