clear();
clc();

figure(1)
pause();

uicontrol('style','pushbutton', 'callback','th=th+0.01;','units','normalized','position',[0.05 0.05 0.1, 0.05])
uicontrol('style','pushbutton', 'callback','th=th-0.01;','units','normalized','position',[0.16 0.05 0.1, 0.05])
uicontrol('style','pushbutton', 'callback','keep_going = 0;','units','normalized','position',[0.27 0.05 0.1, 0.05])

NIter = 20;
th = 0.6;

cam = webcam(2);

keep_going = 1;
while keep_going
    Icap = cam.snapshot;
    I = Icap(:,:,2);
    [H, W] = size(I);
    BW = segment(I, th);
    imagesc(BW)
    drawnow()
end


setL = bwconncomp(BW);
L = processComp(setL, H);

disp('click lower left corner')
p1 = ginput(1);
disp('click lower right corner')
p2 = ginput(1);
disp('click upper right corner')
p3 = ginput(1);
disp('click upper left corner')
p4 = ginput(1);

idx1 = getClosestIdx(L, p1);
idx2 = getClosestIdx(L, p2);
idx3 = getClosestIdx(L, p3);
idx4 = getClosestIdx(L, p4);


G = gridComp(L, idx1, idx2, idx3, idx4);

R = computeRegions(L, G);


disp('start masking... (will take a while)')
pause()

%M = maskRegions(W, H, R);
load('M')

[calibratedCx, calibratedCy] = processImage(BW, M, R);

while 1
    newIcap = cam.snapshot();
    newI = newIcap(:,:,2);
    newBW = segment(newI, th);
    
    [newCx, newCy] = processImage(newBW, M, R);
    
    z = sqrt((calibratedCy-newCy).^2 + (calibratedCx-newCx).^2);
    zz = imresize(z,[480, 640]);
    
    figure(1);
    cla();
    hold('on');
    imagesc(zz(end:-1:1,:), 'alphadata',0.2)
    quiver(calibratedCy, calibratedCx, calibratedCy-newCy, calibratedCx-newCx,'linewidth',2);
    
    axis([1 640 1 480])
    
    drawnow()
end