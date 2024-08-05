Dado('que o usuario consulte informacoes de funcionario') do
    @get_list = Employee_Requests.new
    @assert = Assertions.new
  end
  
  Quando('ele realizar a pesquisa') do
    @list_employee = @get_list.find_employee
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    @assert.request_success(@create_employee.code, @create_employee.message)
  end

Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    @assert = Assertions.new
  end
    
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name], DATABASE[:salary], DATABASE[:age])
    puts @create_employee
  end
    
  Entao('esse funcionario sera cadastrado') do
    @assert.request_success(@create_employee.code, @create_employee.message)
    expect(@create_employee['data']["employee_name"]).to eql DATABASE[:name]
  end

Dado('que o usuario altere uma informacao de funcionario') do
    @request = Employee_Requests.new
    @assert = Assertions.new
  end
    
  Quando('ele enviar as novas informacoes') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], DATABASE[:name], DATABASE[:salary], DATABASE[:age])     
    puts(@update_employee)
  end
      
  Entao('as informacoe serao alteradas') do
    @assert.request_success(@create_employee.code, @create_employee.message)
    expect(@update_employee['data']["employee_salary"]).to eql DATABASE[:salary]
  end

Dado('que o usuario queira deletar um funcionario') do
    @request = Employee_Requests.new
    @assert = Assertions.new
  end
      
  Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
    puts @delete_employee
  end
      
  Entao('esse funcionario sera deletado do sistema') do
    @assert.request_success(@create_employee.code, @create_employee.message)
    expect(@delete_employee["status"]).to eql 'success'
  end