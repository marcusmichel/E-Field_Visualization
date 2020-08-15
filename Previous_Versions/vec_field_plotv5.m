
%% Initialization of file
clear; clc;

% yz field
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/320rails_sphere60-20/sphere_320rails_320nm5ds_675.E','%t',23,0);
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/waveguide/filledWG80/E_fields/fwg80_20nm5ds_1550.E','%t',23,0);

% E field file
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/waveguide/filledWG80/E_fields/fwg80_0nm5ds_1550.E','%t',23,0);
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/rails/320rails_sphere60-20/sphere_320rails_0nm5ds_675.E','%t',23,0);
field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/simple_tests/20nmSphere/20nmSphere_yzCS.E','%t',23,0);
% xy field
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/160rails_sphere60-20/xy_z-0_5ds_675.E','%t',23,0);

% superTitle = '320 Rails&Sphere@320nm';

% Before running, fill out each of these with the correct information
crossSctn = '0';
wavelength = '675';
waveguideLength = '320';
dipoleSpacing = '5';
% Full Mesh or Variable Mesh
mesh = 'Full Mesh';
%Set to 'true' if you want to export each figure, 'false' if not. 
export = false;
% Make sure this directory exists--it's what you're exporting to
exportDir = '/Users/marcusmichel/Projects/MatLab/320rails_20-60sphere_675slices/';
% Are you in the xy plane? If not, it's assumed you're in the yz plane.
xy = false;

superTitle = [wavelength,'nm Incident on ',newline,waveguideLength,'nm ',mesh,' ',dipoleSpacing, 'nmds WG @ ',crossSctn,'nm'];



% This just clarifies we're in the xy or yz plane
yz = true;
if xy 
    yz = false;
end

reEx = field(:,4);
imEx = field(:,5);
reEy =field(:,6);
imEy = field(:,7);
reEz = field(:,8);
imEz = field(:,9);

reE_x = field(:,4);
imE_x = field(:,5);
reE_y =field(:,6);
imE_y = field(:,7);
reE_z = field(:,8);
imE_z = field(:,9);


x = field(:,1);
y = field(:,2);
z = field(:,3);

%  Change this based on which cross section you're looking at
if xy
    a = abs(max(x)) + abs(min(x)) + 1;
    b = abs(max(y)) + abs(min(y)) + 1;
elseif yz
    a = abs(max(y)) + abs(min(y)) + 1;
    b = abs(max(z)) + abs(min(z)) + 1;
end

reEx = reshape(reEx, [b,a]);
imEx = reshape(imEx, [b,a]);
reEy = reshape(reEy, [b,a]);
imEy = reshape(imEy, [b,a]);
reEz = reshape(reEz, [b,a]);
imEz = reshape(imEz, [b,a]);
%% Cross Sections through waveguide
clc
%Cross sections through waveguide
% figure('Position',[0,0,2304,1440])
figure('Position',[0,0,800,650])
% Title = suptitle(title);
sup = suptitle(superTitle)
sup.FontSize = 15;

% Ey_mag = Ey_mag1 - Ey_mag2;
% Real x component
    if yz
        sp1 = subplot(3,2,1)
        pcolor(reEx)
        c = colorbar('southoutside');
    elseif xy
        sp1 = subplot(1,6,1)
        pcolor(reEx)
        c = colorbar;
    end
    %     sp1 = subplot(3,2,1)
    %     % sp1 = subplot(1,6,1)

        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.1300,0.7093+.02,.3347,.01];
    elseif xy
        c.Position = [0.1441-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ex)')
        % colorbar off

% Imaginary x component
    if yz
        sp2 = subplot(3,2,2)
        pcolor(imEx)
        c = colorbar('southoutside');
    elseif xy
        sp2 = subplot(1,6,2)
        pcolor(imEx)
        c = colorbar;
    end
    %     sp2 = subplot(3,2,2)
        % sp2 = subplot(1,6,2)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.7093+.02,.3347,.01];
    elseif xy
        c.Position = [0.2787-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ex)')
        % colorbar off

% Real y component
    if yz
        sp3 = subplot(3,2,3)
        pcolor(reEy)
        c = colorbar('southoutside');
    elseif xy
        sp3 = subplot(1,6,3)
        pcolor(reEy)
        c = colorbar;
    end
    %     sp3 = subplot(3,2,3)
        % sp3 = subplot(1,6,3)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz 
        c.Position = [0.1300,0.4096+.02,.3347,.01];
    elseif xy 
        c.Position = [0.4132-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ey)')
        % colorbar off


% Imaginary y component
    if yz
        sp4 = subplot(3,2,4)
        pcolor(imEy)
        c = colorbar('southoutside');
    elseif xy
        sp4 = subplot(1,6,4)
        pcolor(imEy)
        c = colorbar;
    end
    %     sp4 = subplot(3,2,4)
        % sp6 = subplot(1,6,4)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.4096+.02,.3347,.01];
    elseif xy
        c.Position = [0.5478-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ey)')
        %colorbar off

% Real z component
    if yz
        sp5 = subplot(3,2,5)
        pcolor(reEz)
        c = colorbar('southoutside');
    elseif xy
        sp5 = subplot(1,6,5)
        pcolor(reEz)
        c = colorbar;
    end
    %     sp5 = subplot(3,2,5)
        % sp5 = subplot(1,6,5)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz 
        c.Position = [0.1300,0.1100+.02,.3347,.01];
    elseif xy
        c.Position = [0.6823-.015,0.1100+.11,0.01,0.59];
    end
        shading flat
        shading interp
        axis equal
        axis off
        title('Re(Ez)')
        % colorbar off

% Imaginary z component
    if yz
        sp6 = subplot(3,2,6)
        pcolor(imEz)
        c = colorbar('southoutside');
    elseif xy
        sp6 = subplot(1,6,6)
        pcolor(imEz)
        c = colorbar;
    end
    %     sp6 = subplot(3,2,6)
        % sp6 = subplot(1,6,6)
        shading interp
        colormap(jet)
        % colorbar off
        % c.FontSize = 8;
    if yz
        c.Position = [0.5703,0.1100+.02,.3347,.01];
    elseif xy
        c.Position = [0.8168-.015,0.1100+.11,0.01,0.59];
    end

        shading flat
        shading interp
        axis equal
        axis off
        title('Im(Ez)')
        % colorbar off
       
if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_components.png'])
end
%% Magnitude of components of E Field

figure()
%Magnitude of components of electric field
magX = sqrt(field(:,4).^2 + field(:,5).^2);
magY = sqrt(field(:,6).^2 + field(:,7).^2);
magZ = sqrt(field(:,8).^2 + field(:,9).^2);

magE = magX;

% a = abs(max(x)) + abs(min(x)) + 1;
% % a = abs(max(y)) + abs(min(y)) + 1;
% b = abs(max(y)) + abs(min(y)) + 1;

magX = reshape(magX, [b,a]);
magY = reshape(magY, [b,a]);
magZ = reshape(magZ, [b,a]);

% figure();
if yz
    subplot(3,1,1)
elseif xy
    subplot(1,3,1)
end
pcolor(magX)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
title('|Ex|')

% figure();
if yz
    subplot(3,1,2)
elseif xy
    subplot(1,3,2)
end
pcolor(magY)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
title('|Ey|')

% figure();
if yz
    subplot(3,1,3)
elseif xy
    subplot(1,3,3)
end

pcolor(magZ)
shading interp
colormap(jet)
colorbar
shading flat
shading interp
axis equal
axis off
title('|Ez|')

if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_magnitudes.png'])
end
%% Vector Plot

% figure()
figure('Position',[0,0,1000,650])
%Elements defining the shape
x = field(:,1);
y = field(:,2);
z = field(:,3);

%Grabbing the real x,y,z components of the E-field
% reE_y = field(:,6)./sqrt(field(:,6).^2 + field(:,8).^2);
% reE_z = field(:,8)./sqrt(field(:,6).^2 + field(:,8).^2);

% reE_x = field(:,4)./max(field(:,4));
% reE_z = field(:,8)./max(field(:,4));


% zero = zeros(5313,1);

%Real part of components WITHIN the plane
if xy
    r = [x, y, reE_x, reE_y];
elseif yz
    r = [y,z, reE_y, reE_z];
end


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

%Vector plot

% clf clears the current figure
% clf;

% figure()
if xy
    v = subplot(1,2,1)
elseif yz
    v = subplot(2,1,1)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
% v.Position = [1,1,1,1]
%axis([-35,35,-35,35]);
axis off
title('Real E-field','Fontsize',18)


%Imaginary E field in plane

x = field(:,1);
y = field(:,2);
z = field(:,3);

imE_x = field(:,5);
imE_y = field(:,7);
imE_z = field(:,9);

if xy
    r = [x, y, imE_x, imE_y];
elseif yz 
    r = [y, z, imE_y, imE_z];
end

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

% figure()
if xy
    subplot(1,2,2)
elseif yz
    subplot(2,1,2)
end
quiver(r1,r2,r3,r4,1,'k','Linewidth',1)
axis equal
%axis([-35,35,-35,35]);
axis off
title('Imaginary E-field','Fontsize',18)


if export
    saveas(gcf,[exportDir,crossSctn,'_',wavelength,'_vectorPlots.png'])
end

%% Center Line Calculation
% 
% %Center Line Calculation 
% 
% % field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/waveguide/filledWG/centerLine.E','%t',23,0);
% field = dlmread('/Users/marcusmichel/Projects/SimulationCode/DDA_7.1/waveguide/7.1/rails/160rails_sphere60-20/centerLine.E','%t',23,0);
% % figure()
% %
% dipoleSpacing = 5;
% x = field(:,1)*5;
% magEx = (field(:,4).^2 +field(:,5).^2).^(1/2);
% magEy = (field(:,6).^2 +field(:,7).^2).^(1/2);
% magEz = (field(:,8).^2 +field(:,9).^2).^(1/2);
% 
% reE = (field(:,4).^2 +field(:,6).^2 +field(:,8).^2).^(1/2);
% imE = (field(:,5).^2 +field(:,7).^2 +field(:,9).^2).^(1/2);
% 
% figure()
% %Real and Imaginary components of E
%     subplot(2,1,1)
%     plot(x,reE)
%     title('|Real E|')
%     xlabel('x Distance Along Length of Slot (nm)')
%     
% 
% 
%     subplot(2,1,2)
%     plot(x,imE)
%     title('|Imaginary E|`')
%      xlabel('x Distance Along Length of Slot (nm)')
% 
% %Magnitude of each component of E
%     figure()
%     subplot(3,1,1)
%     plot(x,magEx)
%     title('|Ex|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,1,2)
%     plot(x,magEy)
%     title('|Ey|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,1,3)
%     plot(x,magEz)
%     title('|Ez|')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
% %Each component of E
%     figure()
%     suptitle('160nm Rails + Sphere')
% %     x = field(:,1);
%     reEx = field(:,4);
%     imEx = field(:,5);
%     reEy = field(:,6);
%     imEy = field(:,7);
%     reEz = field(:,8);
%     imEz = field(:,9);
% 
%     subplot(3,2,1)
%     plot(x,reEx)
%     title('Real Ex')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,2)
%     plot(x,imEx)
%     title('Imaginary Ex')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,2,3)
%     plot(x,reEy)
%     title('Real Ey')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,4)
%     plot(x,imEy)
%     title('Imaginary Ey')
%     xlabel('x Distance Along Length of Slot (nm)')
% 
%     subplot(3,2,5)
%     plot(x,reEz)
%     title('Real Ez')
%     xlabel('x Distance Along Length of Slot (nm)')
%     subplot(3,2,6)
%     plot(x,imEz)
%     title('Imaginary Ez')
%     xlabel('x Distance Along Length of Slot (nm)')