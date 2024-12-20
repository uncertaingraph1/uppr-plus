function  gen_src_tar(ds, l, d)

    fpath =  '..\..\datasets\';
    savepath = '..\src_tar\';
  
    fn = [fpath, ds, '.mat'];
    load(fn);
    a = Problem.A;

   
    n = length(a);

    G = digraph(a);
    D = outdegree(G);
    [hd, idx] =  sort(D, "descend");
    src = idx(1:l);

    tar = cell(l,1);
    for i = 1 : l
        z = find(~a(src(i),:));
        tar{i} = z(randperm(length(z), d-1));
    end

    savefn = [savepath,'ds_',ds,'_l',int2str(l),'_d',int2str(d), '.mat'];
    disp(savefn)
    save(savefn, 'src','tar');
