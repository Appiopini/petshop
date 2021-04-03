class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
        redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @Pet = Pet.find(params[:id])
    # redirect_to root_path, notice: 'Not allowed to Update 😥'
    # authorize @Pet
    if @Pet.update(pet_params)
      redirect_to pet_path(@Pet), notice: 'Pet updated!'
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    # redirect_to root_path, notice: 'Not allowed to Delete 😠'
    # authorize @pet
    @pet.destroy
    redirect_to pets_path, notice: 'pet destroyed!'
  end

  private

  def pet_params
    params.require(:pet).permit(:owner, :name, :race, :care)
  end
end
