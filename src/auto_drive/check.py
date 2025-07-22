import os

def print_tree(start_path, indent=""):
    # 현재 디렉토리 내 파일/폴더 리스트
    files = os.listdir(start_path)
    for i, f in enumerate(sorted(files)):
        path = os.path.join(start_path, f)
        connector = "└── " if i == len(files) - 1 else "├── "
        print(indent + connector + f)
        if os.path.isdir(path):
            # 마지막 요소면 indent를 다르게 해서 재귀
            new_indent = indent + ("    " if i == len(files) - 1 else "│   ")
            print_tree(path, new_indent)

if __name__ == "__main__":
    # 현재 스크립트가 있는 디렉토리부터 시작
    current_dir = os.path.dirname(os.path.abspath(__file__))
    print(f"디렉토리 트리 구조: {current_dir}\n")
    print_tree(current_dir)
