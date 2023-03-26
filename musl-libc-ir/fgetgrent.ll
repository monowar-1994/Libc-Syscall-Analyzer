; ModuleID = 'src/passwd/fgetgrent.c'
source_filename = "src/passwd/fgetgrent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.group = type { i8*, i8*, i32, i8** }
%struct._IO_FILE = type opaque

@fgetgrent.line = internal global i8* null, align 8
@fgetgrent.mem = internal global i8** null, align 8
@fgetgrent.gr = internal global %struct.group zeroinitializer, align 8

; Function Attrs: nounwind optsize strictfp
define %struct.group* @fgetgrent(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.group*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = bitcast %struct.group** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #3
  %6 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #3
  store i64 0, i64* %3, align 8, !tbaa !3
  %7 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #3
  store i64 0, i64* %4, align 8, !tbaa !3
  %8 = call i32 @__getgrent_a(%struct._IO_FILE* noundef %0, %struct.group* noundef nonnull @fgetgrent.gr, i8** noundef nonnull @fgetgrent.line, i64* noundef nonnull %3, i8*** noundef nonnull @fgetgrent.mem, i64* noundef nonnull %4, %struct.group** noundef nonnull %2) #4
  %9 = load %struct.group*, %struct.group** %2, align 8, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #3
  ret %struct.group* %9
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__getgrent_a(%struct._IO_FILE* noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
