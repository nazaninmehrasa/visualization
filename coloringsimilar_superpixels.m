%function coloring2( frame_numbers, superPixels)
  
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')
    
    %finding the 300 top similar superpixel
    sup=20;
    simNum=300;
    row20=similarities(sup,:);
    [sorted_row, Ind]=sort(row20);
    superPixels1=Ind(1,1:simNum);
    
    %creating the superPixels matrix and frame_numbers array
    [frame_numbers,superPixels]=cons_superPixel(mapped, superPixels1);
    
    %coloring
    coloring1(frame_numbers,superPixels,sup);
    
    
    
     
%end
