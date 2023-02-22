package com.java_task.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java_task.entities.Employee;
import com.java_task.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public void saveEmployee(Employee employee) {
		employeeRepository.save(employee);
		
	}

	@Override
	public List<Employee> showAllEmployees() {
		List<Employee> employeeList = employeeRepository.findAll();
		return employeeList;
	}

	@Override
	public void deleteById(long id) {
		employeeRepository.deleteById(id);
		
	}

	@Override
	public Employee updateEmployee(long id) {
		Optional<Employee> findById = employeeRepository.findById(id);
		Employee employee = findById.get();
		return employee;
	}

}
