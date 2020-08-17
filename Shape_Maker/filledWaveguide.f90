program shapemaker
  !Where's implicit none?
    ! Here is where we declared variables that this shapemaker
    ! will use. 
  integer :: radius, centroid
    integer :: Sx, Sy, Sz, zshift
    integer :: Lx, Ly, Lz, gap
    integer :: x,y,z,idx, idx1, idx2
    real :: zbot, ztop, ybot, ytop, xfront, xback
    real :: dipoleSpacing,spaceGap, withOffset, noOffset, approximate
    integer :: offset
    logical :: exact
    character(len=200)::row

    ! Parameters
    !Note: certain dipole spacings will not divide evenly into spaceGap/2--this will result in a slot width that is 
    !approximated by going to the next nearest dipole.
    !Change the dipoleSpacing and spaceGap as needed
    dipoleSpacing = 5 !(nm)
    !spaceGap should be an even number
    spaceGap = 50 !(nm)

    !Rail parameters: Length of the rail (into the waveguide) is in the x direction, width is in the y direction
    !(across the face of the waveguide), and height is the z direction (up the face of the waveguide).
    !The shape file is created with the y and z coordinates centered on the origin, and the front face at x = 0. 
    railLength = 80
    railWidth = 350
    railHeight = 150

    ! noOffset = abs((2(int(spaceGap/2/dipoleSpacing))*dipoleSpacing)*dipoleSpacing - spaceGap/dipoleSpacing)
    withOffset = abs((2*int(spaceGap/(2*dipoleSpacing))+1)*dipoleSpacing-spaceGap)
    noOffset = abs(2*int(spaceGap/(2*dipoleSpacing))*dipoleSpacing-spaceGap)


    gap = int(spaceGap/dipoleSpacing)
    ! This offset is turned on or off to get closest to the actual slot width.
    offset = 1
    exact = .FALSE.
    if(spaceGap/dipoleSpacing/2==int(spaceGap/dipoleSpacing/2)) then
       offset = 0
       exact = .TRUE.

    else if(withOffset>noOffset) then
      offset = 0
    
    end if

    approximate = (2*int(spaceGap/(2*dipoleSpacing))+offset)*dipoleSpacing

    if(.NOT. exact .AND. approximate/=spaceGap) then
      write(*,*) "CAUTION:"
      write(*,*) "    Dipole Spacing doesn't evenly divide into spaceGap/2."
      write(*,*) "    Approximate slot width:", int(approximate), "nm"
    end if


  !Rail parameters
    ! Lx = Int(1000/dipoleSpacing)
    Lx = Int(railLength/dipoleSpacing)
!    Ly = Int(350/dipoleSpacing)
    Ly = Int(railWidth/dipoleSpacing)
    Lz = Int(railHeight/dipoleSpacing)

    !Substrate Parameters
    Sx = Lx
    ! Sy = Int(700/dipoleSpacing)
    Sy = Int((2*railWidth)/dipoleSpacing)
    Sz = Int(railHeight/dipoleSpacing)

    !Dipole counter
    idx = 0

!     !Substrate Parameters
!     Sx = Int(160/dipoleSpacing)
!     Sy = Int(700/dipoleSpacing)
!     Sz = Int(150/dipoleSpacing)
!     !radius = 10
!     idx = 0
    
!     !Rail parameters
! !    Lx = Int(160/dipoleSpacing)
!     Lx = Sx
! !    Ly = Int(350/dipoleSpacing)
!     Ly = Int(350/dipoleSpacing)
!     Lz = Int(150/dipoleSpacing)
!    zshift = Int((Lz+Sz)/dipoleSpacing)
    !Location o    LCx = Int(

    
    ! Here we open a temporary file, that will be deleted later. 
    ! This is my rigged way of getting around allocating the size
    ! of an array for our shape
    open(12, file='temp',status='replace')

    !The material indexes in ddscat.par should go: 1. Left Block, 2. Right Block, 3. Substrate
    ! This loops over our grid                                                                                 ! The +1 adds an extra dipole on each side. 

    !This loops over our grid for the Left (-y) block
    do x = -(Lx/2),(Lx/2)
       do y = -(Ly+gap/2),-(gap/2+offset)
          do z = -(Lz/2),(Lz/2)
             
             idx = idx+1
             write(12,*) idx ,x ,y ,z ,1,1,1
             
          end do 
       end do 
    end do

    !This loops over our grid for the Right block (+y)                                                            
    do x = -(Lx/2),(Lx/2)
       do y = (gap/2),(Ly+gap/2)
          do z = -(Lz/2),(Lz/2)

             idx = idx+1
             write(12,*) idx ,x ,y ,z ,2,2,2

          end do
       end do
    end do

    ! This is the substrate
    do x = -(Sx/2),(Sx/2)
       do y = -(Sy/2+gap/2),(Sy/2+gap/2)
          !The +1 is to make sure the substrate and the rail don't overlap
          do z = -(Lz/2 + Sz),-(Lz/2 + 1)

                idx = idx+1
                write(12,*) idx ,x ,y ,z ,3,3,3
           !  end if                                                                                                                       
          end do
       end do
    end do
    
    ! This is the chromophore between the rails                                                                                                                                                                                                             
    do x = -(Sx/2),(Sx/2)
       do y = -(gap/2-1+offset),(gap/2-1)
          !The +1 is to make sure the chromophore and the rail don't overlap                                                  \
                                                                                                                               
          do z = -(Lz/2),(Lz/2)

                idx = idx+1
                write(12,*) idx ,x ,y ,z ,4,4,4
          end do
       end do
    end do

    ! This is the chromophore on top of the rails                                                                             \
                                                                                                                               
    do x = -(Sx/2),(Sx/2)
       do y = -(Sy/2+gap/2),(Sy/2+gap/2)

          do z = (Lz/2+1),(3*Lz/2)

                idx = idx+1
                write(12,*) idx ,x ,y ,z ,4,4,4
          end do
       end do
    end do

    close(12)

    ! We now reopen the file
    open(12, file='temp',status='old')
    ! We now create our shape file
    open(13, file='shape.dat',status='replace')
    
    ! And write the header of the file
    write(13,*) 'Sphere shape'
    write(13,*) idx, '= number of dipoles in target'
    write(13,*) '1.000000 0.000000 0.000000 = A_1 vector'
    write(13,*) '0.000000 1.000000 0.000000 = A_2 vector'
    write(13,*) '1.000000 1.000000 1.000000 = (d_x,d_y,d_z)/d'
    write(13,*) '0.000000 0.000000 0.000000 = (x,y,z)/d'
    write(13,*) 'JA  IX  IY  IZ ICOMP(x,y,z)'

! And here we read the information of the temporary file, and 
! rewrite it after the header.
do x = 1,idx
   read(12,'(a)') row 
   write(13,'(a)') trim(row)
end do

!Here we delete the temporary file and close the shape file.
close(12,status='delete')
close(13)

end program shapemaker
