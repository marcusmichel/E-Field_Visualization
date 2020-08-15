%%Electric Field Vector Plot

clear; clc;

field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/simple_tests/ddfield.E','%t',23,0);
%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_edge/17.5/bottom/ddfield.E','%t',23,0);

%field = [field1(:,1) field1(:,2) field1(:,3) field1(:,4) - field2(:,4) field1(:,5) - field2(:,5) field1(:,6) - field2(:,6) field1(:,7) - field2(:,7) field1(:,8) - field2(:,8)  field1(:,9) - field2(:,9)];
%Elements defining the shape
s_x = field(:,1);
s_y = field(:,2);
s_z = field(:,3);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

reE_y = field(:,6);
reE_z = field(:,8);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


r = [s_x, s_z, reE_y, reE_z];


r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);



%Grabbing the imaginary x,y,z components of the E-field
% imE_x = field(:,5)./max(field(:,5));
% imE_y = field(:,7)./sqrt(field(:,7).^2 + field(:,9).^2);
% imE_z = field(:,9)./sqrt(field(:,7).^2 + field(:,9).^2);
% 
% %Grouping shape and field elements into an array for optional editing
% i = [s_y, s_z, imE_y, imE_z];
% 
% i1 = i(:,1);
% i2 = i(:,2);
% i3 = i(:,3);
% i4 = i(:,4);
% 
% i1 = i1(1:a:end,:);
% i2 = i2(1:a:end,:);
% i3 = i3(1:a:end,:);
% i4 = i4(1:a:end,:);

%Vector plot
clf;

hold on
%rectangle('Position',[-62,-62,28,125],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
%viscircles([0,0],30,'Color','r','Linewidth',3);
%viscircles([0,35],30,'Color','r','Linewidth',5);


quiver(r1,r2,r3,r4,.8,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


% 
% figure
% hold on
% rectangle('Position',[-25,-25,50,50],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
% quiver(i1,i2,i3,i4,1,'k','Linewidth',1)
% axis equal
% axis([-35,35,-35,35]);
% axis off
% title('Imaginary E-field')


% 2-D E-Field Line Plot

%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_face/15.2/bottom/ddfield.E','%t',23,0);
%%
E_mag = sqrt(field(:,4).^2 + field(:,5).^2 + field(:,6).^2 + ...
             field(:,7).^2 + field(:,8).^2 + field(:,9).^2);

x = field(:,1);
y = field(:,2);
z = field(:,3);
%E_mag = reshape(E_mag./max(E_mag), [101,101]);

a = abs(max(x)) + abs(min(x)) + 1;
b = abs(max(z)) + abs(min(z)) + 1;

E_mag = reshape(E_mag./max(E_mag), [b,a]);


figure;
pcolor(E_mag)


shading flat
shading interp

colormap(jet)
caxis([0,1.25])

colorbar
shading flat
shading interp
axis equal

axis off
title('|E|/|E|_{max}')

%%%%
%%

clear; clc;

field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails10ds80l/20nm5ds.E','%t',23,0);

%y component plot

%y component of magnetic field
% Ey_mag1 = field1(:,6);
reEy =field(:,6) ;
max(reEy)
min(reEy)

x = field(:,1);
y = field(:,2);
z = field(:,3);

a = abs(max(y)) + abs(min(y)) + 1;
b = abs(max(z)) + abs(min(z)) + 1;

% Ey_mag = Ey_mag1 - Ey_mag2;

reEy = reshape(reEy, [b,a]);

figure;
pcolor(reEy)
shading flat
shading interp

colormap(jet)
%Here you can adjust the color scale


caxis([-3.5,0])



colorbar
shading flat
shading interp
%This makes sure the axes aren't stretched to fit
axis equal

%This is to prevent confusion with respect to the axis formatting
%If we don't include the correct coordinates, then we shouldn't include
%coordinates at all.
axis off
title('Re(Ey)Rails 80nm in, 5nm Dipole Spacing')

%%

clear; clc;

field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails5ds80l/40nm5ds_1310.E','%t',23,0);
%y component plot

%y component of electric field
reEy =field(:,6);
max(reEy)
min(reEy)

x = field(:,1);
y = field(:,2);
z = field(:,3);

a = abs(max(y)) + abs(min(y)) + 1;
% a = abs(max(y)) + abs(min(y)) + 1;
b = abs(max(z)) + abs(min(z)) + 1;

% Ey_mag = Ey_mag1 - Ey_mag2;

reEy = reshape(reEy, [b,a]);

% reEy(:,1)
% plot(reEy)

figure;
pcolor(reEy)
% shading flat
shading interp

colormap(jet)
%Here you can adjust the color scale
%caxis([-1,1])

% caxis([-8,6])
% caxis([-2.2,2.5])
colorbar
shading flat
shading interp
%This makes sure the axes aren't stretched to fit
axis equal

%This is to prevent confusion with respect to the axis formatting
%If we don't include the correct coordinates, then we shouldn't include
%coordinates at all.
axis off
% str = "Re(Ey) Middle Cross Section of 960nm Long Empty Waveguide";
% str = str + newline +"1310nm Plane Wave,10nm Dipole Spacing"
% title('Re(Ey) Rail 0nm (front) 625nm Plane Wave, 5nm Dipole Spacing')
% title('Electric Field Im(z) Component 142.37nm PW 1nm ds')
% title(str)


%%
%%Electric Field Vector Plot

%field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/simple_tests/ddfield.E','%t',23,0);
%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_edge/17.5/bottom/ddfield.E','%t',23,0);

%field = [field1(:,1) field1(:,2) field1(:,3) field1(:,4) - field2(:,4) field1(:,5) - field2(:,5) field1(:,6) - field2(:,6) field1(:,7) - field2(:,7) field1(:,8) - field2(:,8)  field1(:,9) - field2(:,9)];
%Elements defining the shape
s_x = field(:,1);
s_y = field(:,2);
s_z = field(:,3);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

reE_y = field(:,6);
reE_z = field(:,8);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


r = [s_y, s_z, reE_y, reE_z];


r1 = r(:,1);
r2 = r(:,2);
r3 = r(:,3);
r4 = r(:,4);


%Thinning parameter
a = 2;

r1 = r1(1:a:end,:);
r2 = r2(1:a:end,:);
r3 = r3(1:a:end,:);
r4 = r4(1:a:end,:);



%Grabbing the imaginary x,y,z components of the E-field
% imE_x = field(:,5)./max(field(:,5));
% imE_y = field(:,7)./sqrt(field(:,7).^2 + field(:,9).^2);
% imE_z = field(:,9)./sqrt(field(:,7).^2 + field(:,9).^2);
% 
% %Grouping shape and field elements into an array for optional editing
% i = [s_y, s_z, imE_y, imE_z];
% 
% i1 = i(:,1);
% i2 = i(:,2);
% i3 = i(:,3);
% i4 = i(:,4);
% 
% i1 = i1(1:a:end,:);
% i2 = i2(1:a:end,:);
% i3 = i3(1:a:end,:);
% i4 = i4(1:a:end,:);

%Vector plot
clf;

hold on
%rectangle('Position',[-62,-62,28,125],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
%viscircles([0,0],30,'Color','r','Linewidth',3);
%viscircles([0,35],30,'Color','r','Linewidth',5);


quiver(r1,r2,r3,r4,.8,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


% 
% figure
% hold on
% rectangle('Position',[-25,-25,50,50],'Curvature',.1,'Linewidth',2,'Linestyle','-.','Edgecolor','m')
% quiver(i1,i2,i3,i4,1,'k','Linewidth',1)
% axis equal
% axis([-35,35,-35,35]);
% axis off
% title('Imaginary E-field')


% 2-D E-Field Line Plot

%field = dlmread('/Users/elliotbeutler/Desktop/Projects/superquadric/mgo_face/15.2/bottom/ddfield.E','%t',23,0);