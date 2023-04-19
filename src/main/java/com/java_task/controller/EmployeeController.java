package com.java_task.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.java_task.entities.Employee;
import com.java_task.payload.PostResponse;
import com.java_task.service.EmployeeService;


@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/createEmployee")
	public String viewCreateEmployee(Model model) {
		model.addAttribute("employee", new Employee());
		return "create_employee";
	}
	
	@RequestMapping("/saveEmployee")
	public String saveEmployee(@ModelAttribute("employee") Employee employee,Model model) {
		employeeService.saveEmployee(employee);
		List<Employee> list = employeeService.showAllEmployees();
		model.addAttribute("employee", list);
		return "list_employees";
	}
	
	@RequestMapping("/listall")
	public String getAllLeads(Model model){
		List<Employee> employee = employeeService.showAllEmployees();
		model.addAttribute("employee", employee);
		return "list_employees";
	}
	@RequestMapping("/delete")
	public String deleteEmployee(@RequestParam("id") long id,Model model) {
		employeeService.deleteById(id);
		model.addAttribute("deleted", "Employee Record Deleted successfully!");
		List<Employee> employee = employeeService.showAllEmployees();
		model.addAttribute("employee", employee);
		return "list_employees";
	}
	@RequestMapping("/update")
	public String updateForm(@RequestParam("id")long id,Model model) {
		Employee employee = employeeService.updateEmployee(id);
		model.addAttribute("employee", employee);
		return "update_employee";
	}
	
	@RequestMapping("/edit")
	public String updateEmployee(@ModelAttribute("employee")Employee employee,
			Model model) {
		employeeService.saveEmployee(employee);
		List<Employee> employees = employeeService.showAllEmployees();
		model.addAttribute("employee", employees);
		model.addAttribute("edited", "Employee Details Updated Successfully!");
		return "list_employees";
	}
	
	@GetMapping("/search")
	public String searchByName(@RequestParam("name") String name,Model model) {
		List<Employee> records = employeeService.searchByName(name);
		model.addAttribute("record", records);
		return "view_details";
	}
}
