; ModuleID = 'src/stdio/vsscanf.c'
source_filename = "src/stdio/vsscanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__isoc99_vsscanf = weak alias i32 (i8*, i8*, %struct.__va_list_tag*), i32 (i8*, i8*, %struct.__va_list_tag*)* @vsscanf

; Function Attrs: nounwind optsize strictfp
define i32 @vsscanf(i8* noalias noundef %0, i8* noalias noundef %1, %struct.__va_list_tag* noundef %2) #0 {
  %4 = alloca %struct._IO_FILE, align 8
  %5 = bitcast %struct._IO_FILE* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %5) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(232) %5, i8 0, i64 232, i1 false) #5
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 8
  store i64 (%struct._IO_FILE*, i8*, i64)* @string_read, i64 (%struct._IO_FILE*, i8*, i64)** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 11
  store i8* %0, i8** %7, align 8, !tbaa !10
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 19
  store volatile i32 -1, i32* %8, align 4, !tbaa !11
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %4, i64 0, i32 21
  store i8* %0, i8** %9, align 8, !tbaa !12
  %10 = call i32 @vfscanf(%struct._IO_FILE* noundef nonnull %4, i8* noundef %1, %struct.__va_list_tag* noundef %2) #6
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %5) #4
  ret i32 %10
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind optsize strictfp
define internal i64 @string_read(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 21
  %5 = load i8*, i8** %4, align 8, !tbaa !12
  %6 = add i64 %2, 256
  %7 = tail call i8* @memchr(i8* noundef %5, i32 noundef 0, i64 noundef %6) #6
  %8 = icmp eq i8* %7, null
  %9 = ptrtoint i8* %7 to i64
  %10 = ptrtoint i8* %5 to i64
  %11 = sub i64 %9, %10
  %12 = select i1 %8, i64 %6, i64 %11
  %13 = icmp ult i64 %12, %2
  %14 = select i1 %13, i64 %12, i64 %2
  %15 = tail call i8* @memcpy(i8* noundef %1, i8* noundef %5, i64 noundef %14) #6
  %16 = getelementptr inbounds i8, i8* %5, i64 %14
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %16, i8** %17, align 8, !tbaa !13
  %18 = getelementptr inbounds i8, i8* %5, i64 %12
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %18, i8** %19, align 8, !tbaa !14
  store i8* %18, i8** %4, align 8, !tbaa !12
  ret i64 %14
}

; Function Attrs: optsize
declare i32 @vfscanf(%struct._IO_FILE* noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 64}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 88}
!11 = !{!4, !5, i64 140}
!12 = !{!4, !8, i64 152}
!13 = !{!4, !8, i64 8}
!14 = !{!4, !8, i64 16}
