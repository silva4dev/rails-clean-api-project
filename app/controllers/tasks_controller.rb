require_relative '../application/task/commands/create_task_command'
require_relative '../application/task/commands/create_sub_task_command'
require_relative '../infra/queries/tasks_query'
require_relative '../application/task/task_use_case'

class TasksController < ApplicationController
  # Command
  def create_task
    command = Application::Task::Commands::CreateTaskCommand.new(
      user_id: params[:user_id],
      name: params[:name],
      status: params[:status]
    )
    task_id = Application::Task::TaskUseCase.new.create_task(command)

    head :created, location: "tasks/#{task_id}"
  end

  def create_sub_task
    command = Application::Task::Commands::CreateSubTaskCommand.new(
      task_id: params[:task_id],
      name: params[:name],
      status: params[:status]
    )
    sub_task_id = Application::Task::TaskUseCase.new.create_sub_task(command)

    head :created, location: "sub_tasks/#{sub_task_id}"
  end

  # Query
  def find_all_tasks
    tasks = Application::Task::TaskUseCase.new.find_all_tasks
    render json: tasks, status: :ok
  end
end
