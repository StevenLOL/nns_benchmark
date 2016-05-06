%%%% Transform database and query
function transform_base_query(file_path,data_name,K)

type = 'NP';
vocabSize = 2^K;
R_opq_p = fvecs_read(['../R_init/' data_name '_' num2str(vocabSize) type '.fvecs']);
dataset = fvecs_read(['~/Downloads/Dataset/' file_path '/data/' data_name '_base.fvecs']);


dataset = R_opq_p' * dataset;
fvecs_write([ '~/Downloads/Dataset/' file_path '/data/' data_name '_base_' num2str(vocabSize) type '.fvecs'],dataset);

query = fvecs_read(['~/Downloads/Dataset/' file_path '/query/' data_name '_query.fvecs']);
query = R_opq_p' * query;

fvecs_write (['~/Downloads/Dataset/' file_path '/query/' data_name '_query_' num2str(vocabSize) type '.fvecs'],query);

end
