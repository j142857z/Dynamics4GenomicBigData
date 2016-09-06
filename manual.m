set_paths_and_imports;

GEO_number = 'GSE3440';

[list_of_genes, raw_gene_expression, raw_time_points, subject_name, condition, gene_ID_type, number_of_top_DRGs_considered] = step_1(GEO_number);

[gene_expression, time_points, smooth_gene_trajectories] = step_2(raw_gene_expression, raw_time_points, true);

[list_of_DRGs, indices_of_DRGs, indices_of_genes_sorted_by_F_value, smooth_gene_expression, fd_smooth_coefficients] = step_3(list_of_genes, gene_expression, time_points, number_of_top_DRGs_considered, smooth_gene_trajectories, true);

[list_of_gene_clusters, gene_expression_by_cluster, list_of_cluster_means] = step_4(gene_expression, time_points, list_of_DRGs, indices_of_DRGs, indices_of_genes_sorted_by_F_value, smooth_gene_expression, number_of_top_DRGs_considered, true);

step_5(list_of_genes, list_of_gene_clusters, indices_of_DRGs, gene_ID_type);

adjacency_matrix_of_gene_regulatory_network = step_7(list_of_gene_clusters, time_points, indices_of_DRGs, fd_smooth_coefficients, true);

step_8(adjacency_matrix_of_gene_regulatory_network);
