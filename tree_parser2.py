import sys
from collections import defaultdict, deque

def parse_file(file_path):
    """Parses the file and builds a graph."""
    graph = defaultdict(list)
    weights = {}
    with open(file_path, 'r') as f:
        for line in f:
            if '->' in line:
                parts = line.strip().split(' -> ')
                node1 = parts[0]
                node2, weight = parts[1].split(': ')
                graph[node1].append(node2)
                graph[node2].append(node1)
                weights[(node1, node2)] = float(weight)
                weights[(node2, node1)] = float(weight)
    return graph, weights

def find_leaf_paths(graph, weights, start_id):
    """Finds paths from start_id to all other leaves."""
    def is_leaf(node):
        # A leaf is a node that starts with RS_ or GB_ and has no more children.
        return (node.startswith('RS_') or node.startswith('GB_')) and len(graph[node]) == 1

    # BFS to find all paths
    paths = {}
    visited = set()
    queue = deque([(start_id, [start_id], 0)])  # (current node, current path, current length)

    while queue:
        current, path, length = queue.popleft()
        if current in visited:
            continue
        visited.add(current)

        # If a leaf is found, store the path and length
        if is_leaf(current) and current != start_id:
            paths[current] = (path, length)

        # Add neighbors to the queue
        for neighbor in graph[current]:
            if neighbor not in visited:
                edge_weight = weights[(current, neighbor)]
                queue.append((neighbor, path + [neighbor], length + edge_weight))

    return paths

def main(file_path, start_id):
    graph, weights = parse_file(file_path)
    if start_id not in graph:
        print(f"ID {start_id} not found in the file.")
        return

    paths = find_leaf_paths(graph, weights, start_id)
    for leaf, (path, length) in paths.items():
        path_str = " -> ".join(path)
        print(f"Path: {path_str}, Length: {length:.4f}")

if __name__ == "__main__":
    # Example usage: python script.py input.txt RS_GCF_001513965.1
    if len(sys.argv) != 3:
        print("Usage: python script.py <file path> <ID>")
    else:
        file_path = sys.argv[1]
        start_id = sys.argv[2]
        main(file_path, start_id)
