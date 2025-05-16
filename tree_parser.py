from Bio import Phylo

# Specify the input file and the path for saving the output file
input_file = "bac120_r226.tree"  # Name of your input file
output_file = "pairs_with_distances_indexed.txt"  # Name of the output file

# Load the tree
tree = Phylo.read(input_file, "newick")

# Function to extract node pairs and distances with indexing of internal nodes
def extract_pairs_with_indexing(tree, internal_prefix="Node_"):
    pairs = []
    internal_node_counter = 0

    def get_node_name(node):
        nonlocal internal_node_counter
        if node.name is None or node.name.startswith("InternalNode"):  # If the node has no name or a default one
            name = f"{internal_prefix}{internal_node_counter}"
            internal_node_counter += 1
            node.name = name  # Assign a name to the node
            return name
        return node.name

    for clade in tree.find_clades():  # Iterate over all nodes in the tree
        clade.name = get_node_name(clade)  # Assign a name if it's missing
        for child in clade.clades:  # Traverse child nodes
            pair = (clade.name, get_node_name(child))
            distance = child.branch_length if child.branch_length is not None else 0.0
            pairs.append((pair, distance))
    return pairs

# Extract pairs and distances
pairs = extract_pairs_with_indexing(tree)

# Save results to a file
with open(output_file, "w") as f:
    for pair, distance in pairs:
        f.write(f"{pair[0]} -> {pair[1]}: {distance:.4f}\n")

print(f"Results saved to file: {output_file}")
