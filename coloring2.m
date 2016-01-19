%function coloring2( frame_numbers, superPixels)
   % frame_numbers=[1 21];
    superPixels=[1 2263;12 0];
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')
    count=0;
    frame_numbers=[];
    for i=1:size(superPixels,2)
        [row,col]=find(mapped==superPixels(1,i));
        frame_numbers=[frame_numbers row];
        for j=1:size(superPixels,1)
            if(superPixels(j,i)~=0)
                [row,col]=find(mapped==superPixels(j,i));
                superPixels(j,i)=col;
            end
        end   
    end
    
    
    
    for frame = 1:21
        idx=find(frame_numbers==frame);
        if(~isempty(idx))
           % figure;
            img=zeros(360,640);
            img = (cat(3,img,img,img));
            sp_temp=superPixels(:,idx);
            for i=1:360
                for j=1:640
                    sp_idx=(find(sp_temp==labelledlevelvideo(i,j,frame)));
                    if(~isempty(sp_idx))
                       count=count+1;
                        img(i,j,1)=255;
                        img(i,j,2)=255;
                        img(i,j,3)=255;
                    end
                end
            end
            %imshow(img);
            imwrite(img,['./coloring/',num2str(frame),'.jpg']);
        end
    end
    
    
     
%end
